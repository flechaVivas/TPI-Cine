package entities;

import java.time.LocalDate;

public class User {
	
	private int idUser;
	private String surname;
	private String name;
	private String email;
	private String password;
	private LocalDate birthDate;
	private String adress;
	private String phoneNumber;
	private Role role;
	
	
	public int getIdUser() {
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
	public LocalDate getBirthDate() {
		return birthDate;
	}
	public void setBirthDate(LocalDate birthDate) {
		this.birthDate = birthDate;
	}
	public String getAdress() {
		return adress;
	}
	public void setAdress(String adress) {
		this.adress = adress;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public Role getRole() {
		return role;
	}
	public void setRole(Role role) {
		this.role = role;
	}

	public Boolean estaAutorizado() {
		
		if ((this.getRole().getDescription()).equals("admin")) {
			return true;
		} else {
			return false;
		}
	}
	
	public Boolean esTaquillero() {
		if((this.getRole().getDescription()).equals("taquillero")) {
			return true;
		} else {
			return false;					
		}
	}
	
	
	
	
}
