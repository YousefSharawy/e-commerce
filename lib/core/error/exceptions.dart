class AppExceptions implements Exception{
  final String message;
  AppExceptions(this.message);
}

class RemoteException extends AppExceptions{
  RemoteException(super.message);
}