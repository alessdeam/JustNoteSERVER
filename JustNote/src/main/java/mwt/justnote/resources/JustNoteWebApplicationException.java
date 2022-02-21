package mwt.justnote.resources;

import javax.ws.rs.WebApplicationException;
import javax.ws.rs.core.Response;

public class JustNoteWebApplicationException extends WebApplicationException {

	public JustNoteWebApplicationException() {
		super(Response.serverError().build());
	}
	public JustNoteWebApplicationException(String message) {
		super(Response.serverError()
				      .entity(message)
				      .type("text/plain")
				      .build());
	}
}
