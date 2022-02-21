package mwt.justnote.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Session {

	private Long id;
	private String token;
	private Utente utente;

}
