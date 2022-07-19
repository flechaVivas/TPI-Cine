package entities;

public class User {
	
	private int idUser;
	private String surname;
	private String name;
	private String email;
	private String password;
	private String birthDate = "dd/MM/yyyy";
	private String adress;
	private int phoneNumber;
	private Role role;
	
	public int getIdUser(){
		return idUser;
	}
	public void setIdUser(int idUser) {
		this.idUser = idUser;
	}
	public String getSurname() {
		return surname;
	}
	public void setSurname(String surname) {
		this.surname = surname;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getBirthDate() {
		return birthDate;
	}
	public void setBirthDate(String birthDate) {
		this.birthDate = birthDate;
	}
	public String getAdress() {
		return adress;
	}
	public void setAdress(String adress) {
		this.adress = adress;
	}
	public int getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(int phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public Role getRole() {
		return role;
	}
	public void setRole(Role role) {
		this.role = role;
	}
	
	@Override
	public String toString() {
		return "User [idUser=" + idUser + ", surname=" + surname + ", name=" + name + ", email=" + email + ", password="
				+ password + ", birthDate=" + birthDate + ", adress=" + adress + ", phoneNumber=" + phoneNumber
				+ ", role=" + role + "]";
	}
	
	
	
	
}
