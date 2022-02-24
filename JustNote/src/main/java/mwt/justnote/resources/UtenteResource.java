package mwt.justnote.resources;

import mwt.justnote.model.Nota;
import mwt.justnote.model.Utente;
import mwt.justnote.services.AuthenticationService;
import mwt.justnote.services.JustNoteBusinessException;
import mwt.justnote.services.UtenteService;
import mwt.justnote.services.impl.AuthenticationServiceImpl;
import mwt.justnote.services.impl.UtenteServiceImpl;

import javax.ws.rs.*;
import javax.ws.rs.core.*;
import java.net.URI;

@Path("/Utente")
public class UtenteResource {

    private UtenteService utenteService = new UtenteServiceImpl();
    private AuthenticationService authenticationService = new AuthenticationServiceImpl();

    @GET
    @Path("/GetUtenteById/{token}/{idUtente}")
    public Response GetUtenteById(
            @PathParam("token") String token,
            @PathParam("idUtente") long idUtente) {
        try {
            if(authenticationService.checkSession(token)) {
                Utente utente = utenteService.getUtenteById(idUtente);

                return Response.ok(utente).build();
            }else {
                return Response.status(Response.Status.UNAUTHORIZED).build();
            }
        } catch (JustNoteBusinessException e) {
            throw new JustNoteWebApplicationException("Errore interno al server");
        }
    }

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

    @PUT
    @Path("/{id}/{token}")
    @Consumes({MediaType.APPLICATION_JSON})
    @Produces({MediaType.APPLICATION_JSON})
    public Response UpdateUtente(@PathParam("id") Long id,
                               @PathParam("token") String token,
                               @Context UriInfo uriInfo,
                               Utente utente) throws IllegalArgumentException, UriBuilderException {

        if (utente == null) {
            return Response.status(Response.Status.BAD_REQUEST).build();
        }
        if (id == null) {
            return Response.status(Response.Status.BAD_REQUEST).build();
        }
        try {
            if(authenticationService.checkSession(token)) {
                utenteService.updateUtente(utente, id);
                return Response.ok().build();

            } else {
                return Response.status(Response.Status.UNAUTHORIZED).build();
            }
        } catch (JustNoteBusinessException e) {
            throw new JustNoteWebApplicationException("Errore interno al server");
        }
    }

}