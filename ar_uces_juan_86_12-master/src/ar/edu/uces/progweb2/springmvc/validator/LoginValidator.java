package ar.edu.uces.progweb2.springmvc.validator;


import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;
import ar.edu.uces.progweb2.springmvc.modelView.UsuarioForm;

@Component
public class LoginValidator implements Validator{
	
	@Override
	public boolean supports(Class<?> clazz) {
		return UsuarioForm.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object object, Errors errors) {
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "user", "errors.login.user.empty");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "errors.login.password.empty");
		
	}

}
