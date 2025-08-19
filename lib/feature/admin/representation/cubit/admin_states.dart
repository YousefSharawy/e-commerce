abstract class AdminStates {}
class AdminInitialState extends AdminStates {} 
class AcceptVendorLoading extends AdminStates {}
class AcceptVendorSucess extends AdminStates {}
class AcceptVendorError extends AdminStates {
  String message;

  AcceptVendorError(this.message);
}
class DenyVendorLoading extends AdminStates {}
class DenyVendorSucess extends AdminStates {}
class DenyVendorError extends AdminStates {
  String message;

  DenyVendorError(this.message);
}
class GetVendorsLoading extends AdminStates {}
class GetVendorsSucess extends AdminStates {}
class GetVendorsError extends AdminStates {
  String message;

  GetVendorsError(this.message);
}
