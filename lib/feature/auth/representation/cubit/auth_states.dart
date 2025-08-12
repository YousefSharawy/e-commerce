abstract class AuthStates {}

class InitState implements AuthStates {}

class LoginLoading implements AuthStates {}

class RegisterLoading implements AuthStates {}
class LogoutLoading implements AuthStates {}
class LogoutSuccess implements AuthStates {}
class LogoutError implements AuthStates {
  String message ; 
  LogoutError(this.message);
}

// Replace single LoginSuccess with role-specific success states
class LoginSuccessUser implements AuthStates {}

class LoginSuccessVendor implements AuthStates {}

class LoginSuccessAdmin implements AuthStates {}

class RegisterSuccess implements AuthStates {}

class LoginError implements AuthStates {
  String message;
  LoginError(this.message);
}

class RegisterError implements AuthStates {
  String message;
  RegisterError(this.message);
}
