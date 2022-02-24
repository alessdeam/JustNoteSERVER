package mwt.justnote.resources;

import mwt.justnote.model.Categoria;
import mwt.justnote.model.Nota;
import mwt.justnote.model.NotaCondivisa;
import mwt.justnote.services.AuthenticationService;
import mwt.justnote.services.JustNoteBusinessException;
import mwt.justnote.services.NotaService;
import mwt.justnote.services.impl.AuthenticationServiceImpl;
import mwt.justnote.services.impl.NotaServiceImpl;

import javax.ws.rs.*;
import javax.ws.rs.core.*;
import java.net.URI;
import java.util.List;

@Path("/Nota")
public class NotaResource {

    private NotaService notaService = new NotaServiceImpl();
    private AuthenticationService authenticationService = new AuthenticationServiceImpl();

    @GET
    @Path("/GetNoteByIdUtente/{token}/{idUtente}")
    public Response GetNoteByIdUtente(
            @PathParam("token") String token,
            @PathParam("idUtente") Long idUtente) {
        try {
            if(authenticationService.checkSession(token)) {
                List<Nota> note = notaService.getNoteByIdUtente(idUtente);

                return Response.ok(note).build();
            }else {
                return Response.status(Response.Status.UNAUTHORIZED).build();
            }
        } catch (JustNoteBusinessException e) {
            throw new JustNoteWebApplicationException("Errore interno al server");
        }
    }

    @GET
    @Path("/GetNoteByIdArea/{token}/{idArea}")
    public Response GetNoteByIdArea(
            @PathParam("token") String token,
            @PathParam("idArea") Long idArea) {
        try {
            if(authenticationService.checkSession(token)) {
                List<Nota> note = notaService.getNoteByIdArea(idArea);

                return Response.ok(note).build();
            }else {
                return Response.status(Response.Status.UNAUTHORIZED).build();
            }
        } catch (JustNoteBusinessException e) {
            throw new JustNoteWebApplicationException("Errore interno al server");
        }
    }

    @GET
    @Path("/GetNoteCondiviseByIdUtente/{token}/{idUtente}")
    public Response GetNoteCondiviseByIdUtente(
            @PathParam("token") String token,
            @PathParam("idUtente") Long idUtente) {
        try {
            if(authenticationService.checkSession(token)) {
                List<NotaCondivisa> note = notaService.getNoteCondiviseByIdUtente(idUtente);

                return Response.ok(note).build();
            }else {
                return Response.status(Response.Status.UNAUTHORIZED).build();
            }
        } catch (JustNoteBusinessException e) {
            throw new JustNoteWebApplicationException("Errore interno al server");
        }
    }

    @GET
    @Path("/GetNoteByIdUtenteAndIdCategoria/{token}/{idUtente}/{idCategoria}")
    public Response GetNoteByIdUtenteAndIdCategoria(
            @PathParam("token") String token,
            @PathParam("idUtente") Long idUtente,
            @PathParam("idCategoria") Long idCategoria) {
        try {
            if(authenticationService.checkSession(token)) {
                List<Nota> note = notaService.getNoteByIdUtenteAndIdCategoria(idUtente, idCategoria);

                return Response.ok(note).build();
            }else {
                return Response.status(Response.Status.UNAUTHORIZED).build();
            }
        } catch (JustNoteBusinessException e) {
            throw new JustNoteWebApplicationException("Errore interno al server");
        }
    }

    @POST
    @Path("/{token}")
    @Consumes({MediaType.APPLICATION_JSON})
    @Produces({MediaType.APPLICATION_JSON})
    public Response InsertNota(Nota nota, @Context UriInfo uriInfo,
                               @PathParam("token") String token) {
        try {
            if(authenticationService.checkSession(token)) {
                notaService.insertNota(nota);

                if(nota.getTitolo() != null) {

                    URI Uri = uriInfo.getAbsolutePathBuilder().path(nota.getTitolo()).build();

                    return Response.created(Uri).build();
                } else {
                    return Response.ok().build();
                }
            } else {
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
    public Response UpdateNota(@PathParam("id") Long id,
                                     @PathParam("token") String token,
                                     @Context UriInfo uriInfo,
                                     Nota nota) throws IllegalArgumentException, UriBuilderException {

        if (nota == null) {
            return Response.status(Response.Status.BAD_REQUEST).build();
        }
        if (id == null) {
            return Response.status(Response.Status.BAD_REQUEST).build();
        }
        try {
            if(authenticationService.checkSession(token)) {
                notaService.updateNota(nota, id);
                return Response.ok().build();

            } else {
                return Response.status(Response.Status.UNAUTHORIZED).build();
            }
        } catch (JustNoteBusinessException e) {
            throw new JustNoteWebApplicationException("Errore interno al server");
        }
    }

    @Path("/{token}/{id}")
    @DELETE
    public Response DeleteNota(@PathParam("token") String token, @PathParam("id") int idNota) {
        try {
            if(authenticationService.checkSession(token)) {
                Boolean response = notaService.deleteNota(idNota);

                if(response) {
                    return Response.noContent().build();
                } else {
                    return Response.ok().build();
                }
            } else {
                return Response.status(Response.Status.UNAUTHORIZED).build();
            }
        } catch (JustNoteBusinessException e) {
            throw new JustNoteWebApplicationException("Errore interno al server");
        }
    }

    @POST
    @Path("/condividi/{token}/{email}")
    @Consumes({MediaType.APPLICATION_JSON})
    @Produces({MediaType.APPLICATION_JSON})
    public Response CondividiNota(NotaCondivisa nota, @Context UriInfo uriInfo,
                                  @PathParam("token") String token,
                                  @PathParam("email") String email) {
        try {
            if(authenticationService.checkSession(token)) {
                notaService.condividiNota(nota, email);

                if(nota.getTitolo() != null) {

                    URI Uri = uriInfo.getAbsolutePathBuilder().path(nota.getTitolo()).build();

                    return Response.created(Uri).build();
                } else {
                    return Response.ok().build();
                }
            } else {
                return Response.status(Response.Status.UNAUTHORIZED).build();
            }
        } catch (JustNoteBusinessException e) {
            throw new JustNoteWebApplicationException("Errore interno al server");
        }
    }

}