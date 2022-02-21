package mwt.justnote.model;


import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class NotaCondivisa extends Nota {

    private Nota notaParent;
    private boolean permessoModifica;
    private boolean permessoCondivisione;
    private boolean permessoCancellazione;

}
