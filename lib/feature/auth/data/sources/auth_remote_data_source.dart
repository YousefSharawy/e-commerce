import 'package:e_commerce/feature/auth/data/models/user_model.dart';

abstract class AuthRemoteDataSource {

  Future <UserModel> login (String email,String password);
  Future <void> registerAsUser (String email,String name,String password);
  Future <void> registerAsVendor (String email,String name,String password);
}