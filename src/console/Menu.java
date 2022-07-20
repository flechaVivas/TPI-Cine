package console;


import java.util.Scanner;

import entities.*;
import logic.*;

public class Menu {
	Scanner s=null;
	UserController ctrlUser = new UserController();

	public void start() {
		s = new Scanner(System.in);
		User p=login();
		System.out.println("Bienvenido "+p.getName()+" "+p.getSurname());
		System.out.println();
		
		String command;
		do {
			command=getCommand();
			executeCommand(command);
			System.out.println();
			
		}while(!command.equalsIgnoreCase("exit"));
		
		s.close();
	}

	private void executeCommand(String command) {
		switch (command) {
		case "list":
			System.out.println(ctrlUser.getAll());
			break;
		case "find":
			System.out.println(find());
			break;
		case "seach":
	
			break;
		case "new":
			
			break;
		case "edit":
			
			break;
		case "delete":
			
			break;
		default:
			break;
		}
	}

	private String getCommand() {
		System.out.println("Ingrese el comando según la opción que desee realizar");
		System.out.println("list\t\tlistar todos");
		System.out.println("find\t\tbuscar por tipo y nro de documento"); //solo debe devolver 1
		System.out.println("search\t\tlistar por apellido"); //puede devolver varios
		System.out.println("new\t\tcrea una nueva persona y asigna un rol existente");
		System.out.println("edit\t\tbusca por tipo y nro de documento y actualiza todos los datos");
		System.out.println("delete\t\tborra por tipo y nro de documento");
		System.out.println();
		System.out.print("comando: ");
		return s.nextLine();
	}
	
	public User login() {
		User p=new User();
		
		System.out.print("Email: ");
		p.setEmail(s.nextLine());

		System.out.print("password: ");
		p.setPassword(s.nextLine());
		
		p=ctrlUser.validate(p);
		
		return p;
		
	}
	
	private User find() {
		System.out.println();
		User p=new User();
		p.setIdUser(Integer.parseInt(s.nextLine()));
		return ctrlUser.getOne(p);
	}

}
