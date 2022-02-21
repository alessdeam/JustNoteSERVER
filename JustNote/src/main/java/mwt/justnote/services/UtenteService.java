package mwt.justnote.services;


import mwt.justnote.model.Utente;

public interface UtenteService {

    Utente getUtenteByEmail(String email) throws JustNoteBusinessException;

}
