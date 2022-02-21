package mwt.justnote.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Categoria {

    private long id;
    private String nome;
    private Utente utente;
    private Area area;

}
