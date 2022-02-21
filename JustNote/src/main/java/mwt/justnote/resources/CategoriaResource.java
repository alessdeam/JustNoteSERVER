package mwt.justnote.resources;

import mwt.justnote.model.Categoria;
import mwt.justnote.model.Nota;
import mwt.justnote.services.AuthenticationService;
import mwt.justnote.services.CategoriaService;
import mwt.justnote.services.JustNoteBusinessException;
import mwt.justnote.services.impl.AuthenticationServiceImpl;
import mwt.justnote.services.impl.CategoriaServiceImpl;

import javax.ws.rs.*;
import javax.ws.rs.core.*;
import java.net.URI;
import java.util.List;

@Path("/Categoria")
public class CategoriaResource {
    CategoriaService categoriaService = new CategoriaServiceImpl();
    AuthenticationService authenticationService = new AuthenticationServiceImpl();

    @GET
    @Path("/GetCategorieByIdUtente/{token}/{id_utente}")
    public Response GetCategorieByIdUtente(
            @PathParam("token") String token, @PathParam("id_utente") int idUtente) {
        try {
            if(authenticationService.checkSession(token)) {
                List<Categoria> categorie = categoriaService.getCategorieByIdUtente(idUtente);

                return Response.ok(categorie).build();

            } else {
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
    public Response InsertCategoria(Categoria categoria, @Context UriInfo uriInfo,
                                    @PathParam("token") String token) {
        try {
            if(authenticationService.checkSession(token)) {
                categoriaService.insertCategoria(categoria);

                if(categoria.getNome() != null) {

                    URI Uri = uriInfo.getAbsolutePathBuilder().path(categoria.getNome()).build();

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
    public Response UpdateCategoria(@PathParam("id") Long id,
                               @PathParam("token") String token,
                               @Context UriInfo uriInfo,
                               Categoria categoria) throws IllegalArgumentException, UriBuilderException {

        if (categoria == null) {
            return Response.status(Response.Status.BAD_REQUEST).build();
        }
        if (id == null) {
            return Response.status(Response.Status.BAD_REQUEST).build();
        }
        try {
            if(authenticationService.checkSession(token)) {
                categoriaService.updateCategoria(categoria, id);
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
    public Response DeleteCategoria(@PathParam("token") String token, @PathParam("id") int idCategoria) {
        try {
            if(authenticationService.checkSession(token)) {
                Boolean response = categoriaService.deleteCategoria(idCategoria);

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
