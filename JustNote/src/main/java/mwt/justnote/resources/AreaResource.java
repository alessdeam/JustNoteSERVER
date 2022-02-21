package mwt.justnote.resources;

import mwt.justnote.model.Area;
import mwt.justnote.model.Utente;
import mwt.justnote.services.AuthenticationService;
import mwt.justnote.services.AreaService;
import mwt.justnote.services.JustNoteBusinessException;
import mwt.justnote.services.impl.AuthenticationServiceImpl;
import mwt.justnote.services.impl.AreaServiceImpl;

import javax.ws.rs.*;
import javax.ws.rs.core.*;
import java.net.URI;
import java.util.List;

@Path("/Area")
public class AreaResource {
    AreaService areaService = new AreaServiceImpl();
    AuthenticationService authenticationService = new AuthenticationServiceImpl();

    @GET
    @Path("/GetAreeByIdUtente/{token}/{id_utente}")
    public Response GetAreeByIdUtente(
            @PathParam("token") String token, @PathParam("id_utente") int idUtente) {
        try {
            if(authenticationService.checkSession(token)) {
                List<Area> aree = areaService.getAreeByIdUtente(idUtente);

                return Response.ok(aree).build();

            } else {
                return Response.status(Response.Status.UNAUTHORIZED).build();
            }
        } catch (JustNoteBusinessException e) {
            throw new JustNoteWebApplicationException("Errore interno al server");
        }
    }


    @GET
    @Path("/GetAreaById/{token}/{idArea}")
    public Response GetAreaById(
            @PathParam("token") String token,
            @PathParam("idArea") long idArea) {
        try {
            if(authenticationService.checkSession(token)) {
                Area area = areaService.getAreaById(idArea);

                return Response.ok(area).build();
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
    public Response InsertArea(Area area, @Context UriInfo uriInfo,
                                    @PathParam("token") String token) {
        try {
            if(authenticationService.checkSession(token)) {
                areaService.insertArea(area);

                if(area.getNome() != null) {

                    URI Uri = uriInfo.getAbsolutePathBuilder().path(area.getNome()).build();

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
    public Response UpdateArea(@PathParam("id") Long id,
                               @PathParam("token") String token,
                               @Context UriInfo uriInfo,
                               Area area) throws IllegalArgumentException, UriBuilderException {

        if (area == null) {
            return Response.status(Response.Status.BAD_REQUEST).build();
        }
        if (id == null) {
            return Response.status(Response.Status.BAD_REQUEST).build();
        }
        try {
            if(authenticationService.checkSession(token)) {
                areaService.updateArea(area, id);
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
    public Response DeleteArea(@PathParam("token") String token, @PathParam("id") int idArea) {
        try {
            if(authenticationService.checkSession(token)) {
                Boolean response = areaService.deleteArea(idArea);

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

}
