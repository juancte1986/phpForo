package ar.edu.uces.progweb2.springmvc.bussinesException;

public class BackendException extends Throwable {

	private static final long serialVersionUID = 3166578411582369391L;
	
	 	public BackendException() {
	        super();
	    }

	    public BackendException(String message) {
	        super(message);
	    }

	    public BackendException(String message, Throwable cause) {
	        super(message, cause);
	    }

	    public BackendException(Throwable cause) {
	        super(cause);
	    }

}
