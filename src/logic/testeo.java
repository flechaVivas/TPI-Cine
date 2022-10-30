package logic;

import entities.Movie;
import entities.Ticket;

public class testeo {

    public static void main(String[] args) {
        Movie m= new Movie();
        m.setIdMovie(1);
        MovieController ctrlMovie=new MovieController();
        m=ctrlMovie.getbyIdMovie(m);
        System.out.println(m.getTitle());

        Ticket t=new Ticket();
        t.setIdTicket(1);
        TicketController tc=new TicketController();
        t=tc.getOne(t);
        System.out.println(t.getOperationCode());
    }

}