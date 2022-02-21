package mwt.justnote.services;

public class JustNoteBusinessException extends Exception {

	public JustNoteBusinessException() {
		super();
	}
	public JustNoteBusinessException(String arg0, Throwable arg1, boolean arg2, boolean arg3) {
		super(arg0, arg1, arg2, arg3);
	}
	public JustNoteBusinessException(String message, Throwable cause) {
		super(message, cause);
	}
	public JustNoteBusinessException(String message) {
		super(message);
	}
	public JustNoteBusinessException(Throwable cause) {
		super(cause);
	}
}
