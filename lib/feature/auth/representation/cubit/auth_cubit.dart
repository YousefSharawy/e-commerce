import 'package:bloc/bloc.dart';
import 'package:e_commerce/feature/auth/domain/use_cases/login.dart';
import 'package:e_commerce/feature/auth/domain/use_cases/user_register.dart';
import 'package:e_commerce/feature/auth/domain/use_cases/vendor_register.dart';
import 'package:e_commerce/feature/auth/representation/cubit/auth_states.dart';
import 'package:injectable/injectable.dart';

@singleton
class AuthCubit extends Cubit<AuthStates> {
  AuthCubit(this.login, this.userRegister, this.vendorRegister)
    : super(InitState());
  final Login login;
  final UserRegister userRegister;
  final VendorRegister vendorRegister;

  Future<void> userLogin(String email, String password) async {
    emit(LoginLoading());
    final result = await login(email, password);
    result.fold(
      (failure) {
        emit(LoginError(failure.message));

        print('Registration failed: ${failure.message}');
      },
      (user) {
        if (user.authorization == "user") {
          emit(LoginSuccessUser());
        } else if (user.authorization == "vendor") {
          if (user.status != "approved") {
            emit(LoginError("Vendor hasn't been approved yet"));
            return;
          }
          emit(LoginSuccessVendor());
        } else if (user.authorization == "admin") {
          emit(LoginSuccessAdmin());
        }
      },
    );
  }

  Future<void> registerAsUser(
    String email,
    String name,
    String password,
  ) async {
    emit(RegisterLoading());
    final result = await userRegister(email, name, password);
    result.fold((failure) {
      emit(RegisterError(failure.message));
    }, (_) => emit(RegisterSuccess()));
  }

  Future<void> registerAsVendor(
    String email,
    String name,
    String password,
  ) async {
    emit(RegisterLoading());
    final result = await vendorRegister(email, name, password);
    result.fold(
      (failure) => emit(RegisterError(failure.message)),
      (_) => emit(RegisterSuccess()),
    );
  }
}
