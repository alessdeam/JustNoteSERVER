package mwt.justnote.model;

import lombok.*;

@Getter
@Setter
public class Utente {

    private long id;
    private String nome;
    private String cognome;
    private String email;
    private String password;

}
