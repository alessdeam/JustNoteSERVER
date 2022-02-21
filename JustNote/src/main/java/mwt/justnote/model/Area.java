package mwt.justnote.model;

import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
public class Area {
    private long id;
    private String nome;
    private List<Utente> utenti;
}
