package console;


import java.time.LocalDate;
import java.util.LinkedList;
import java.util.Scanner;

import entities.*;
import logic.*;

public class Menu {
	Scanner s=null;
	MovieController ctrlMovie = new MovieController();
	GenreController ctrlGenre = new GenreController();
	RestrictionController ctrlRest=new RestrictionController();
	public void start() {
		s = new Scanner(System.in);
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
			System.out.println(list());
			break;
		case "filt":
			System.out.println(filt());
			break;
		case "find":
			System.out.println(find());
			break;
		case "new":
			System.out.println(nueva());
			break;	
		case "edit":
			System.out.println(edit());
			break;
		case "delete":
			delete();
			break;
		default:
			break;
		}
	}

	private String getCommand() {
		System.out.println("Ingrese el comando según la opción que desee realizar");
		System.out.println("list\t\tlistar todos");
		System.out.println("filt\t\tlistar filtrado");
		System.out.println("find\t\tbuscar por id de pelicula o titulo"); //solo debe devolver 1
		System.out.println("new\t\tcrea una nueva pelicula");
		System.out.println("edit\t\tbusca por idmovie o titulo y actualiza todos los datos");
		System.out.println("delete\t\tborra por idmovie o titulo");
		System.out.println();
		System.out.print("comando: ");
		return s.nextLine();
	}
	
	private LinkedList<Movie> list(){
		LinkedList<Movie> mvs= ctrlMovie.getAll();
		for (Movie mo : mvs) {
			mo.setGenre(ctrlGenre.getOne(mo.getGenre()));
			mo.setRestriction(ctrlRest.getOne(mo.getRestriction()));
		}
		return mvs;
	}
	private LinkedList<Movie> filt() {
		LinkedList<Movie> pels=new LinkedList<Movie>();
		System.out.println("Ingrese el tipo de filtro que desea utilizar");
		System.out.println("1. Por rango de fechas");
		System.out.println("2. Por genero");
		System.out.println("3. Por restriccion de edad");
		System.out.println("4. Por director");
		System.out.println("5. Por maximo de duracion");;
		int key=Integer.parseInt(s.nextLine());
		
		switch (key) {
		case 1:
			Movie mDesde=new Movie();
			Movie mHasta=new Movie();
			System.out.print("Ingrese fecha desde: ");
			mDesde.setReleaseDate(LocalDate.parse(s.nextLine()));
			System.out.println("Ingrese fecha hasta: ");
			mHasta.setReleaseDate(LocalDate.parse(s.nextLine()));
			pels.addAll(ctrlMovie.getByRango(mDesde,mHasta));
			for (Movie mo : pels) {
				mo.setGenre(ctrlGenre.getOne(mo.getGenre()));
				mo.setRestriction(ctrlRest.getOne(mo.getRestriction()));
			}
			break;
			
		case 2:
			System.out.println(ctrlGenre.getAll());
			Genre g=new Genre();
			System.out.print("Ingrese Género: ");
			g.setIdGenre(Integer.parseInt(s.nextLine()));
			pels.addAll(ctrlMovie.getByGen(ctrlGenre.getOne(g)));
			for (Movie mo : pels) {
				mo.setGenre(ctrlGenre.getOne(mo.getGenre()));
				mo.setRestriction(ctrlRest.getOne(mo.getRestriction()));
			}
			break;
			
		case 3:
			System.out.println(ctrlRest.getAll());
			Restriction r=new Restriction();
			System.out.print("Ingrese Restriccion de edad: ");
			r.setIdRestriction(Integer.parseInt(s.nextLine()));
			pels.addAll(ctrlMovie.getByRestri(ctrlRest.getOne(r)));
			for (Movie mo : pels) {
				mo.setGenre(ctrlGenre.getOne(mo.getGenre()));
				mo.setRestriction(ctrlRest.getOne(mo.getRestriction()));
			}
			break;
			
		case 4:
			Movie m=new Movie();
			System.out.print("Ingrese El nombre del director: ");
			m.setDirector(s.nextLine());
			pels.addAll(ctrlMovie.getByDir(m));
			for (Movie mo : pels) {
				mo.setGenre(ctrlGenre.getOne(mo.getGenre()));
				mo.setRestriction(ctrlRest.getOne(mo.getRestriction()));
			}
			break;
			
		case 5:
			Movie mtope=new Movie();
			System.out.println("Ingrese un tope de duracion (En minutos)");
			mtope.setDuration(Integer.parseInt(s.nextLine()));
			pels.addAll(ctrlMovie.getByDur(mtope));
			for (Movie mo : pels) {
				mo.setGenre(ctrlGenre.getOne(mo.getGenre()));
				mo.setRestriction(ctrlRest.getOne(mo.getRestriction()));
			}
			break;

		default:
			break;
		}
		return pels;
	}
	
	private Movie find() {
		Movie mo=new Movie();
		System.out.println("Ingrese el tipo de busqueda a realizar");
		System.out.println("1. Por id");
		System.out.println("2. Por titulo");
		int key=Integer.parseInt(s.nextLine());
		switch (key) {
		case 1:
			System.out.println("Ingrese el Id");
			mo.setIdMovie(Integer.parseInt(s.nextLine()));
			mo=ctrlMovie.getbyIdMovie(mo);
			mo.setGenre(ctrlGenre.getOne(mo.getGenre()));
			mo.setRestriction(ctrlRest.getOne(mo.getRestriction()));
			break;
		case 2:
			System.out.println("Ingrese el titulo");
			mo.setTitle(s.nextLine());
			mo=ctrlMovie.getbyTitle(mo);
			mo.setGenre(ctrlGenre.getOne(mo.getGenre()));
			mo.setRestriction(ctrlRest.getOne(mo.getRestriction()));
			break;
		default:
			break;
		}
			return mo;	
		}
	
	private Movie nueva() {
		Movie m=new Movie();
		Restriction re=new Restriction();
		Genre g=new Genre();
		
		System.out.print("Ingrese titulo: ");
		m.setTitle(s.nextLine());
		System.out.print("Ingrese fecha: ");
		m.setReleaseDate(LocalDate.parse(s.nextLine()));
		System.out.print("Ingrese cast: ");
		m.setCast(s.nextLine());
		System.out.print("Ingrese director: ");
		m.setDirector(s.nextLine());
		System.out.println("Ingrese duracion en minutos: ");
		m.setDuration(Integer.parseInt(s.nextLine()));
		
		System.out.print(ctrlRest.getAll());
		System.out.print("Ingrese la categoria de restriccion: ");
		re.setIdRestriction(Integer.parseInt(s.nextLine()));
		m.setRestriction(ctrlRest.getOne(re));
		
		System.out.print(ctrlGenre.getAll());
		System.out.print("Ingrese la categoria del genero: ");
		g.setIdGenre(Integer.parseInt(s.nextLine()));
		m.setGenre(ctrlGenre.getOne(g));
		
		return ctrlMovie.addOne(m);
	}
	
	private Movie edit(){
		Movie m=new Movie();
		Restriction re=new Restriction();
		Genre g=new Genre();
		System.out.println("Ingrese ID de la pelicula a modificar:");
		m.setIdMovie(Integer.parseInt(s.nextLine()));
		m=ctrlMovie.getbyIdMovie(m);
		
		System.out.print("Ingrese titulo: ");
		m.setTitle(s.nextLine());
		System.out.print("Ingrese fecha: ");
		m.setReleaseDate(LocalDate.parse(s.nextLine()));
		System.out.print("Ingrese cast: ");
		m.setCast(s.nextLine());
		System.out.print("Ingrese director: ");
		m.setDirector(s.nextLine());
		System.out.println("Ingrese duracion en minutos: ");
		m.setDuration(Integer.parseInt(s.nextLine()));
		
		System.out.print(ctrlRest.getAll());
		System.out.print("Ingrese la categoria de restriccion: ");
		re.setIdRestriction(Integer.parseInt(s.nextLine()));
		m.setRestriction(ctrlRest.getOne(re));
		
		System.out.print(ctrlGenre.getAll());
		System.out.print("Ingrese la categoria del genero: ");
		g.setIdGenre(Integer.parseInt(s.nextLine()));
		m.setGenre(ctrlGenre.getOne(g));
		System.out.println("El id de la pelicula es:"+m.getIdMovie());
		return ctrlMovie.editOne(m);
	}
	
	private void delete() {
		Movie m=new Movie();
		System.out.println(ctrlMovie.getAll());
		System.out.println("Ingrese ID de la pelicula a eliminar:");
		m.setIdMovie(Integer.parseInt(s.nextLine()));
		ctrlMovie.deleteOne(m);
	}
}