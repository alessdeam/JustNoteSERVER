package mwt.justnote.services;


import mwt.justnote.model.Nota;
import mwt.justnote.model.Utente;

public interface UtenteService {

    Utente getUtenteById(long email) throws JustNoteBusinessException;

    Utente getUtenteByEmail(String email) throws JustNoteBusinessException;

    public void updateUtente(Utente utente, Long utenteId) throws JustNoteBusinessException;

}
