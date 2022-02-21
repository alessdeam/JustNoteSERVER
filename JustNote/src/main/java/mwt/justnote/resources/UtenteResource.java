package mwt.justnote.resources;

import mwt.justnote.model.Utente;
import mwt.justnote.services.AuthenticationService;
import mwt.justnote.services.JustNoteBusinessException;
import mwt.justnote.services.UtenteService;
import mwt.justnote.services.impl.AuthenticationServiceImpl;
import mwt.justnote.services.impl.UtenteServiceImpl;

import javax.ws.rs.*;
import javax.ws.rs.core.*;

@Path("/Utente")
public class UtenteResource {

    private UtenteService utenteService = new UtenteServiceImpl();
    private AuthenticationService authenticationService = new AuthenticationServiceImpl();

    @GET
    @Path("/GetUtenteByEmail/{token}/{email}")
    public Response GetUtenteByEmail(
            @PathParam("token") String token,
            @PathParam("email") String email) {
        try {
            if(authenticationService.checkSession(token)) {
                Utente utente = utenteService.getUtenteByEmail(email);

                return Response.ok(utente).build();
            }else {
                return Response.status(Response.Status.UNAUTHORIZED).build();
            }
        } catch (JustNoteBusinessException e) {
            throw new JustNoteWebApplicationException("Errore interno al server");
        }
    }

}