package mwt.justnote.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Nota {

    private long id;
    private String titolo;
    private String contenuto;
    private String colore;
    private Categoria categoria;
    private Utente utente;
    private Area area;

}