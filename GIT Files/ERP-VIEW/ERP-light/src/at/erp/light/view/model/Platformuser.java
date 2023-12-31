package at.erp.light.view.model;

// Generated 22.11.2014 18:02:50 by Hibernate Tools 3.4.0.CR1

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;

/**
 * Platformuser generated by hbm2java
 */
@Entity
@Table(name = "platformuser", schema = "public")
public class Platformuser implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1558313783688023600L;
	private int personId;
	private Permission permission;
	private Person person;
	private String password;
	private String loginEmail;

	public Platformuser() {
	}

	public Platformuser(Permission permission, Person person, String password,
			String loginEmail) {
		this.permission = permission;
		this.person = person;
		this.password = password;
		this.loginEmail = loginEmail;
	}

	@GenericGenerator(name = "generator", strategy = "foreign", parameters = @Parameter(name = "property", value = "person"))
	@Id
	@GeneratedValue(generator = "generator")
	@Column(name = "person_id", unique = true, nullable = false)
	public int getPersonId() {
		return this.personId;
	}

	public void setPersonId(int personId) {
		this.personId = personId;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "permission_id", nullable = false)
	public Permission getPermission() {
		return this.permission;
	}

	public void setPermission(Permission permission) {
		this.permission = permission;
	}

	@OneToOne(fetch = FetchType.LAZY)
	@PrimaryKeyJoinColumn
	public Person getPerson() {
		return this.person;
	}

	public void setPerson(Person person) {
		this.person = person;
	}

	@Column(name = "password", nullable = false, length = 200)
	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Column(name = "login_email", nullable = false, length = 50)
	public String getLoginEmail() {
		return this.loginEmail;
	}

	public void setLoginEmail(String loginEmail) {
		this.loginEmail = loginEmail;
	}

}
