
package at.erp.light.view.controller.logging;

import java.util.List;
import java.util.logging.Logger;

import org.hibernate.HibernateException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import at.erp.light.view.dto.LoggingDTO;
import at.erp.light.view.services.IDataBase;

/**
 * This class is a RestController.<br/>
 * It manages the calls concerning system logs.
 * @author Matthias Schn�ll
 *
 */
@RestController
public class LoggingController {
	private static final Logger log = Logger.getLogger(LoggingController.class
			.getName());
	
	@Autowired
	private IDataBase dataBaseService;

	/**
	 * Returns latest system logs
	 * @param count number of logs which should be retrieved
	 * @return list with logging objects from the DB
	 */
	@RequestMapping(value = "secure/logging/getLatestLogs/{count}")
	public List<LoggingDTO> getLatestLogs(@PathVariable int count) {
		
		try {
			List<LoggingDTO> logList;
			if (count > -1)
				logList = dataBaseService.getLatestLoggings(count);
			else
				logList = dataBaseService.getAllLoggings();
			return logList;
		} catch (HibernateException e) {
			e.printStackTrace();
			log.severe("returning latest logs failed");
			return null;
		}
		
	}
	
}
