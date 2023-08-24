import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

//Propio
import 'package:flutter_2_forms_app/infrastrucuture/inputs/inputs.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterState());

  void onSubmit() {
    emit(state.copyWith(
        formStatus: FormStatus.valideting,
        userName: UsernameInput.dirty(value: state.userName.value),
        password: PasswordInput.dirty(value: state.password.value),
        email: EmailInput.dirty(value: state.email.value),
        isValid:
            Formz.validate([state.userName, state.password, state.email])));

    print("Submit: $state");
  }

  void userNameChanged(String value) {
    final username = UsernameInput.dirty(value: value);

    emit(state.copyWith(
        userName: username,
        isValid: Formz.validate([username, state.password])));
  }

  void emailChanged(String value) {
    final email = EmailInput.dirty(value: value);
    //TODO
    emit(state.copyWith(email: email, isValid: Formz.validate([email])));
  }

  void passwordChanged(String value) {
    final password = PasswordInput.dirty(value: value);

    emit(state.copyWith(
        password: password,
        isValid: Formz.validate([password, state.userName])));
  }
}
