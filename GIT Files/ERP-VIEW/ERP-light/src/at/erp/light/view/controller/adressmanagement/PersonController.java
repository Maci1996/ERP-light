package at.erp.light.view.controller.adressmanagement;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.HibernateException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.supercsv.io.CsvBeanWriter;
import org.supercsv.io.ICsvBeanWriter;
import org.supercsv.prefs.CsvPreference;

import at.erp.light.view.authenticate.HashGenerator;
import at.erp.light.view.dto.EmailDTO;
import at.erp.light.view.dto.PersonDTO;
import at.erp.light.view.dto.TelephoneDTO;
import at.erp.light.view.mapper.PersonMapper;
import at.erp.light.view.model.Permission;
import at.erp.light.view.model.Person;
import at.erp.light.view.model.Platformuser;
import at.erp.light.view.services.IDataBase;
import at.erp.light.view.state.ControllerMessage;

/**
 * This class is a RestController.<br/>
 * It manages calls concerning persons.
 * @author Matthias Schn�ll
 *
 */
@RestController
public class PersonController {
	private static final Logger log = Logger.getLogger(PersonController.class
			.getName());
	
	@Autowired
	private IDataBase dataBaseService;

	private PersonController() {
		super();
	}

	
	@RequestMapping(value="secure/person/countActive")
	public int getCountActivePersons() {
		try {
			int count = dataBaseService.getCountActivePersons();
			return count;
		} catch(Exception e) {
			e.printStackTrace();
			return -1;
		}
	}
	
	
	/**
	 * Returns a list with all persons in the system.<br/>
	 * Also includes all inactive persons.
	 * @return list with all persons
	 */
	@RequestMapping(value = "secure/person/getAll")
	public List<PersonDTO> getAllPersons() {
		List<PersonDTO> list = new ArrayList<PersonDTO>();
			
		for (Person p : dataBaseService.getAllPersons()) {
			list.add(PersonMapper.mapToDTO(p));
		}
		
		log.info("returning all Persons!");		
		
		return list;
	}
	
	
	/**
	 * Returns a list with all active persons in the system.<br/>
	 * persons which are marked as inactive are not included.
	 * @return list with all active persons
	 */
	@RequestMapping(value = "secure/person/getAllActive")
	public List<PersonDTO> getAllActivePersons() {
		
		List<PersonDTO> list = new ArrayList<PersonDTO>();
		Date one = new Date();
		
		List<Person> personList = dataBaseService.getAllActivePersons();
		Date two = new Date();
		
		log.info( Long.toString((two.getTime() - one.getTime())/1000) );
		
		for (Person p : personList) {			
			list.add(PersonMapper.mapToDTO(p));			
		}		
		log.info("returning all active Persons!");
			
		return list;
	}
	
	
	/**
	 * Returns a list with a defined number of active persons in the system.<br/>
	 * persons which are marked as inactive are not included.
	 * @param count amount of persons, which should be read
	 * @param offset offset for loading pagewise
	 * @return list with all active persons
	 */
	@RequestMapping(value = "secure/person/getActive")
	public List<PersonDTO> getAllActivePersons(@RequestParam(value="count") int count, 
			@RequestParam(value="offset") int offset) {
		
		List<PersonDTO> list = new ArrayList<PersonDTO>();

		List<Person> personList = dataBaseService.getActivePersons(count, offset);
		
		for (Person p : personList) {
			
			list.add(PersonMapper.mapToDTO(p));
			
		}
		
		log.info("returning active Persons " + offset + " to " + (offset+count) );
			
		return list;
	}
	
	
	/**
	 * Returns a list with all persons in the system.<br/>
	 * Inactive persons are also included.<br/>
	 * The list only contains basic data to reduce transfer data.<br/>
	 * Following data is not included: systemUser, comment, 
	 * updateTimestamp, address, city, zip, country, loginEmail, 
	 * permission, lastEditor, types, emails, telephones
	 * @return list with all persons
	 */
	@RequestMapping(value = "secure/person/reducedData/getAllActive")
	public List<PersonDTO> getAllActivePersonsReducedData() {
		
		List<PersonDTO> list = dataBaseService.getAllActivePersonsReducedData();
		
		log.info("returning all active Persons!");	
			
		return list;
	}

	/**
	 * Returns the person with the given Id.
	 * @param id Id of the requested person
	 * @return PersonDTO object
	 */
	@RequestMapping(value = "secure/person/getPersonById/{id}")
	public PersonDTO getPersonById(@PathVariable int id) {

		Person p = dataBaseService.getPersonById(id);
		PersonDTO person = PersonMapper.mapToDTO(p);
		
		log.info("returning person with id: "+ person.getPersonId());
		return person;
		
	}

	/**
	 * Returns the person object for the current user, which is logged on to the system.
	 * @param request
	 * @param response
	 * @return PersonDTO object
	 */
	@RequestMapping(value = "secure/person/getCurrentUser")
	public PersonDTO getCurrentUser(HttpServletRequest request,
			HttpServletResponse response) {
		int personId = (int) request.getSession().getAttribute("id");

		Person currentPerson = dataBaseService.getPersonById(personId);
		if (currentPerson == null)
			return null;

		PersonDTO currentPersonDTO = PersonMapper.mapToDTO(currentPerson);
		log.info("returning current user!");
		return currentPersonDTO;

	}

	
	/**
	 * Updates data of person, which is logged on to the system.<br/>
	 * Is used to change own data, like address, email, etc.
	 * @param person
	 * @param request
	 * @return ControllerMessage showing the success of the call
	 */
	@RequestMapping(value = "/secure/person/changeMyData")
	ControllerMessage changeMyData(@RequestBody PersonDTO person, HttpServletRequest request) {
		
		try {
			
			Person myNewPerson = PersonMapper.mapToEntity(person);
			int personId = (int)request.getSession().getAttribute("id");
			Person myPerson = dataBaseService.getPersonById(personId);
			
			myPerson.setSalutation(myNewPerson.getSalutation());
			myPerson.setTitle(myNewPerson.getTitle());
			myPerson.setFirstName(myNewPerson.getFirstName());
			myPerson.setLastName(myNewPerson.getLastName());
			myPerson.setAddress(myNewPerson.getAddress());
			myPerson.setCity(myNewPerson.getCity());
			myPerson.setCountry(myNewPerson.getCountry());
			myPerson.setTelephones(myNewPerson.getTelephones());
			myPerson.setEmails(myNewPerson.getEmails());
			myPerson.setComment(myNewPerson.getComment());
			
			myPerson.setLastEditor(dataBaseService.getPersonById(personId));
			dataBaseService.setPerson(myPerson);
			
			// update loginEmail accordingly
			Platformuser platformuser = dataBaseService.getPlatformuserById(personId);
			// get new LoginEmail from personDTO
			platformuser.setLoginEmail(person.getLoginEmail());
			dataBaseService.setPlatformuser(platformuser);

			dataBaseService.insertLogging("[INFO] Person mit der id "+myPerson.getPersonId()+" gespeichert. "+myPerson.toString(), personId);
			
			log.info("Changing MyData successful");
			return new ControllerMessage(true, "Speichern erfolgreich!");
		}
		catch (Exception e) {
			e.printStackTrace();
			log.info("Changing MyData not successful");
			return new ControllerMessage(false, "Speichern nicht erfolgreich!");
		}
		
	}
	
	
	/**
	 * Saves of updates a person in the system.
	 * @param person filled person object, comes from the frontend
	 * @param request
	 * @return ControllerMessage showing the success of the call
	 * @throws NoSuchAlgorithmException
	 * @throws UnsupportedEncodingException
	 */
	@RequestMapping(value = "/secure/person/setPerson")
	ControllerMessage setPerson(@RequestBody PersonDTO person, HttpServletRequest request) throws NoSuchAlgorithmException, UnsupportedEncodingException {
		try {

			// set current user for updater
			int lastEditorId = (int) request.getSession().getAttribute("id");
			// get current User
			String currentUserPermission = dataBaseService.getPlatformuserById(lastEditorId).getPermission().getPermission();
			if (currentUserPermission.equals("Admin") == false)
			{
				return new ControllerMessage(false, "Keine Berechtigung f�r diese Aktion!");
			}
			
			Person entity = PersonMapper.mapToEntity(person);
			entity.setLastEditor(dataBaseService.getPersonById(lastEditorId));
			entity.setUpdateTimestamp(new Date());
	
			// persist Person to DB and get personId (to get the persisted Id if new Person with personId = 0 is saved)
			int personId = dataBaseService.setPerson(entity);
			
			// get persisted Object from DB, because Object 'entity' is only accessed for reading and contains non-persisted data 
			entity = dataBaseService.getPersonById(personId);
			
			log.info("saved person with id: "+entity.getPersonId());
	
			boolean isPlatformuser = person.isSystemUser();
			
			if (isPlatformuser) {
				log.info("person is platformUser");
				Platformuser existingPU = dataBaseService
						.getPlatformuserById(entity.getPersonId()); // get existing Platformuser
				Permission mPermission = dataBaseService
						.getPermissionByPermission(person.getPermission());
				if (existingPU == null) // if platformuser does not exist
				{
					// create new one
					existingPU = new Platformuser(mPermission, entity, HashGenerator.hashPasswordWithSalt("VIEW-Sbg"),
							person.getLoginEmail());
					log.info("created new platfomUser for person with id: "+entity.getPersonId());
				} else { // if platformuser exists
					existingPU.setPermission(mPermission); // update permission
					existingPU.setLoginEmail(person.getLoginEmail()); // update loginEmail
					existingPU.setPerson(entity);
					log.info("updated existing platformUser for person with id: "+entity.getPersonId());
				}
				dataBaseService.setPlatformuser(existingPU); // persist new/edited platformuser to DB
			} else // else remove platformuser (even call, if no platformuser exists)
			{
				dataBaseService.removePlatformuserById(person.getPersonId());
				log.info("no platformUser");
			}
			
			dataBaseService.insertLogging("[INFO] Person mit der id "+entity.getPersonId()+" gespeichert. "+entity.toString(), lastEditorId);
			
			return new ControllerMessage(true, "Speichern erfolgreich!");
		} catch (Exception e) {
			e.printStackTrace();
			log.severe("failed saving person");
			return new ControllerMessage(false, "Speichern fehlgeschlagen!");
		}
	
	}

	
	/**
	 * Deletes the person with the given Id.<br/>
	 * The person is marked as inactive in the system.<br/>
	 * Existing contactPerson entries are removed for the given person
	 * @param id Id of the person which should be deleted
	 * @param request
	 * @return ControllerMessage showing the success of the call
	 */
	@RequestMapping(value = "secure/person/deletePersonById/{id}")
	public ControllerMessage deletePersonById(@PathVariable int id, HttpServletRequest request) {

		int lastEditorId = (int)request.getSession().getAttribute("id");
		
		try {
			String currentUserPermission = dataBaseService.getPlatformuserById(lastEditorId).getPermission().getPermission();
			if (currentUserPermission.equals("Admin") == false)
			{
				return new ControllerMessage(false, "Keine Berechtigung f�r diese Aktion!");
			}
			
			dataBaseService.deletePersonById(id);
		} catch (HibernateException e)
		{
			e.printStackTrace();
			log.severe("deleting person with id "+id+" failed");
			return new ControllerMessage(false, "L�schen fehlgeschlagen!");
		}
		
		log.info("deleted person with id: "+id);
		dataBaseService.insertLogging("[INFO] Person mit der id "+id+" gel�scht", lastEditorId);
		return new ControllerMessage(true, "L�schen erfolgreich!");
		
	}

	
	/**
	 * Reset the password for the person with the given Id.
	 * @param id Id of the Person which the password should be reset for
	 * @param request
	 * @return ControllerMessage showing the success of the call
	 * @throws IOException
	 * @throws NoSuchAlgorithmException
	 */
	@RequestMapping(value = "secure/person/resetPasswordForId/{id}")
	public ControllerMessage resetPasswordForId(@PathVariable int id, HttpServletRequest request)
			throws IOException, NoSuchAlgorithmException {
		try {
			int lastEditorId = (int)request.getSession().getAttribute("id");
			String currentUserPermission = dataBaseService.getPlatformuserById(lastEditorId).getPermission().getPermission();
			if (currentUserPermission.equals("Admin") == false)
			{
				return new ControllerMessage(false, "Keine Berechtigung f�r diese Aktion!");
			}
			
			Platformuser platformuser = dataBaseService.getPlatformuserById(id);
			
			platformuser.setPassword(HashGenerator.hashPasswordWithSalt("VIEW-Sbg"));
			
			dataBaseService.setPlatformuser(platformuser);
			log.info("reset password for user with id "+id);
			dataBaseService.insertLogging("[INFO] Passwort f�r Person mit Id "+id+" zur�ckgesetzt.", lastEditorId);
			return new ControllerMessage(true, "Zur�cksetzen erfolgreich!");
		} catch (Exception e)
		{
			log.severe("resetting password for user "+id+" failed");
			e.printStackTrace();
			return new ControllerMessage(false, "Zur�cksetzen nicht erfolgreich!");
		}
	}

	
	/**
	 * Changes the password for the current user.
	 * @param httpServletRequest
	 * @param changePasswordObject password object from the frontend
	 * @return ControllerMessage showing the success of the call
	 * @throws IOException
	 */
	@RequestMapping(value = "secure/person/changeCurrentUserPassword")
	public ControllerMessage changeCurrentUserPassword(
			HttpServletRequest httpServletRequest,
			@RequestBody ChangePasswordObject changePasswordObject) throws IOException {

		Object currentId = httpServletRequest.getSession().getAttribute("id");
		if (currentId == null) {
			return new ControllerMessage(false, "Nicht eingeloggt");
		} else {
			try {
				Platformuser platformuser = dataBaseService
						.getPlatformuserById((int) currentId);
				if (platformuser == null)
				{
					log.info("user does not exist");
					return new ControllerMessage(false, "User existiert nicht!");
				}
				
				if(!HashGenerator.comparePasswordWithHash(changePasswordObject.getOldPassword(),platformuser.getPassword()))
				{
					log.info("old password incorrect");
					return new ControllerMessage(false, "Altes Passwort falsch!");
				}
				
				platformuser.setPassword(HashGenerator.hashPasswordWithSalt(changePasswordObject.getNewPassword()));
				dataBaseService.setPlatformuser(platformuser);
				log.info("changed password successfully");
				dataBaseService.insertLogging("[INFO] Passwort f�r Person mit Id "+(int)currentId+" ge�ndert.", (int)currentId);
				return new ControllerMessage(true, "�ndern erfolgreich!");
			} catch (Exception e)
			{
				log.severe("changing the password failed");
				return new ControllerMessage(false, "�ndern fehlgeschlagen!");
			}
			
		}
	}

	
	/**
	 * Generates a csv file containing all persons.<br/>
	 * Inactive persons are also included in the csv file.<br/>
	 * The file is returned by writing directly to the response stream.
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping(value = "secure/person/getAllPersonsAsCSV")
	public void downloadCSV(HttpServletRequest request, HttpServletResponse response) throws IOException {

		try {
			SimpleDateFormat sdf = new SimpleDateFormat("dd.MM.yyyy");
			String currentDateString = sdf.format(new Date());
			
			String csvFileName = "Alle Personen_"+currentDateString+".csv";
			response.setContentType("text/csv");
			// creates mock data
			String headerKey = "Content-Disposition";
			String headerValue = String.format("attachment; filename=\"%s\"", csvFileName);
	
			response.setHeader(headerKey, headerValue);
			List<Person> listPersons = dataBaseService.getAllPersons();
			// uses the Super CSV API to generate CSV data from the model data
			ICsvBeanWriter csvWriter = new CsvBeanWriter(response.getWriter(),
					CsvPreference.EXCEL_NORTH_EUROPE_PREFERENCE);
	
			csvWriter.writeHeader("Liste aller Personen:");
			csvWriter.writeHeader("Erstellungsdatum:", currentDateString);
			csvWriter.writeHeader("");
			
			String[] header = { "Personen ID", "Anrede", "Titel", "Nachname",
					"Vorname", "Anschrift", "PLZ", "Stadt", "Land", "Telefonnummern", "Email Adressen",
					"Typen", "Bemerkung", "Login", "Berechtigung", "Letzte �nderung"};
	
			csvWriter.writeHeader(header);
	
			for (Person p : listPersons) {
				
				// skip all persons, which are not acitve anymore
				if (p.getActive() != 1)
				{
					continue;
				}
				
				PersonDTO dto = PersonMapper.mapToDTO(p);
				
				String[] data = new String[16];
				
				// insert Person ID
				data[0] = ""+dto.getPersonId();
				
				// insert salutation
				data[1] = dto.getSalutation();
				
				// insert title
				data[2] = dto.getTitle();
				
				// insert lastName
				data[3] = dto.getLastName();
				
				// insert firstName
				data[4] = dto.getFirstName();
				
				// insert address
				data[5] = dto.getAddress();
				
				// insert zip
				data[6] = dto.getZip();
				
				// insert city
				data[7] = dto.getCity();
				
				// insert country
				data[8] = dto.getCountry();
				
				// insert telephones
				String telephones = "";
				for (int i=0; i<dto.getTelephones().size(); i++)
				{
					TelephoneDTO teldto = dto.getTelephones().get(i);
					telephones += teldto.getType().substring(0, 1)+": ";
					telephones += teldto.getTelephone();
					if (i < (dto.getTelephones().size() - 1))
						telephones += ", ";
				}
				data[9] = telephones;
				
				// insert emails
				String emails = "";
				for (int i=0; i<dto.getEmails().size(); i++)
				{
					EmailDTO emaildto = dto.getEmails().get(i);
					emails += emaildto.getType().substring(0, 1)+": ";
					emails += emaildto.getMail();
					if (i < (dto.getEmails().size() - 1))
						emails += ", ";
				}
				data[10] = emails;
				
				// insert types
				String types = "";
				for (int i=0; i<dto.getTypes().size(); i++)
				{
					types += dto.getTypes().get(i);
					if (i < (dto.getTypes().size()-1) )
						types += ", ";
				}
				data[11] = types;
				
				// insert comment
				data[12] = dto.getComment();
				
				// insert login
				data[13] = dto.getLoginEmail();
				
				// insert permission
				data[14] = dto.getPermission();
				
				// insert last change
				data[15] = dto.getUpdateTimestamp();
				
				csvWriter.writeHeader(data);
			}
	
			log.info("returning CSV Export of Persons");
			
			int id = (int)request.getSession().getAttribute("id");
			dataBaseService.insertLogging("[INFO] Alle Personen als CSV exportiert.", id);
			
			csvWriter.close();
		
		} catch(Exception e) {
			e.printStackTrace();
		}
		
	}

}
