package mwt.justnote.resources;

import mwt.justnote.model.Session;
import mwt.justnote.model.Utente;
import mwt.justnote.services.AuthenticationService;
import mwt.justnote.services.JustNoteBusinessException;
import mwt.justnote.services.impl.AuthenticationServiceImpl;

import javax.ws.rs.*;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.UriInfo;

@Path("/auth")
public class AuthenticationResource {

    private AuthenticationService authenticationService = new AuthenticationServiceImpl();

    @POST
    @Path("/login")
    @Consumes({MediaType.APPLICATION_JSON})
    @Produces({MediaType.APPLICATION_JSON})
    public Response loginUser(@Context UriInfo context, Utente utente) {
        try {
            Session userToken = authenticationService.loginUser(utente);

            if(userToken.getToken() != null) {
                return Response.ok(userToken.getToken()).status(201).build();
            } else {
                return Response.status(Response.Status.FORBIDDEN).build();
            }
        } catch (JustNoteBusinessException e) {
            throw new JustNoteWebApplicationException("Errore interno al server");
        }
    }

    @POST
    @Path("/register")
    @Consumes({MediaType.APPLICATION_JSON})
    @Produces({MediaType.APPLICATION_JSON})
    public Response insertUser(Utente utente, @Context UriInfo uriInfo) {
        try {
            Boolean responseMessage = authenticationService.insertUser(utente);

            if(responseMessage) {
                return Response.ok(responseMessage).status(Response.Status.CREATED).build();
            } else {
                return Response.status(Response.Status.FORBIDDEN).build();
            }
        } catch (JustNoteBusinessException e) {
            throw new JustNoteWebApplicationException("Errore interno al server");
        }
    }

}
