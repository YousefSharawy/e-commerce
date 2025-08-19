import 'package:e_commerce/core/error/exceptions.dart';
import 'package:e_commerce/feature/auth/data/models/user_model.dart';
import 'package:e_commerce/feature/auth/data/sources/auth_remote_data_source.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@Singleton(as: AuthRemoteDataSource)
class AuthRemoteImplDataSource implements AuthRemoteDataSource {
  @override
  Future<UserModel> login(String email, String password) async {
    try {
      await Supabase.instance.client.auth.signInWithPassword(
        password: password,
        email: email,
      );

      final userResponse = await Supabase.instance.client
          .from('users')
          .select('id,email,name,status,authorization')
          .eq('email', email)
          .single();

      return UserModel.fromSupabase(userResponse);
    } catch (exception) {
      String? message;
      if (exception is PostgrestException || exception is AuthException) {
        message = (exception as dynamic).message;
      }
      throw RemoteException(message ?? "Failed to login");
    }
  }

  @override
  Future<void> registerAsUser(
    String email,
    String name,
    String password,
  ) async {
    try {
      final response = await Supabase.instance.client.auth.signUp(
        email: email,
        password: password,
        data: {'name': name},
      );

      final userId = response.user!.id;

      await Supabase.instance.client.from('users').insert({
        'id': userId,
        'email': email,
        'name': name,
        'status': "approved",
        'authorization': "user",
      });
    } catch (exception) {
      String? message;
      if (exception is PostgrestException) {
        message = exception.message;
      } else if (exception is AuthException) {
        message = exception.message;
      } else if (exception is RemoteException) {
        message = exception.message;
      } 

      throw RemoteException(message ?? "Failed to Register");
    }
  }

  @override
  Future<void> registerAsVendor(
    String email,
    String name,
    String password,
  ) async {
    try {
      final response = await Supabase.instance.client.auth.signUp(
        email: email,
        password: password,
        data: {'name': name},
      );

      final userId = response.user!.id;

      await Supabase.instance.client.from('users').insert({
        'id': userId,
        'email': email,
        'name': name,
        'status': "pending",
        'authorization': "vendor",
      });
    } catch (exception) {
      String? message;
      if (exception is PostgrestException) {
        message = exception.message;
      } else if (exception is AuthException) {
        message = exception.message;
      } else if (exception is RemoteException) {
        message = exception.message;
      } 

      throw RemoteException(message ?? "Failed to register as vendor");
    }
  }

  @override
  Future<void> logout() async {
    try {
      await Supabase.instance.client.auth.signOut();
    } catch (exception) {
      String? message;
      if (exception is PostgrestException) {
        message = exception.message;
      } else if (exception is AuthException) {
        message = exception.message;
      }
      throw RemoteException(message ?? "Failed to log out");
    }
  }
}
