package mwt.justnote.services;

import mwt.justnote.model.Session;
import mwt.justnote.model.Utente;

import java.sql.*;

public interface AuthenticationService {

    public Session loginUser(Utente utente) throws JustNoteBusinessException;

    public Boolean insertUser(Utente utente) throws JustNoteBusinessException;

    public Boolean checkSession(String token) throws JustNoteBusinessException;

}
