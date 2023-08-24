part of 'register_cubit.dart';

enum FormStatus { invalid, valid, valideting, posting }

class RegisterState extends Equatable {
  const RegisterState(
      {this.isValid = false,
      this.userName = const UsernameInput.pure(),
      this.email = const EmailInput.pure(),
      this.password = const PasswordInput.pure(),
      this.formStatus = FormStatus.invalid});
  final UsernameInput userName;
  final EmailInput email;
  final PasswordInput password;
  final FormStatus formStatus;
  final bool isValid;

  RegisterState copyWith(
          {UsernameInput? userName,
          EmailInput? email,
          PasswordInput? password,
          FormStatus? formStatus,
          bool? isValid}) =>
      RegisterState(
          email: email ?? this.email,
          formStatus: formStatus ?? this.formStatus,
          password: password ?? this.password,
          userName: userName ?? this.userName,
          isValid: isValid ?? this.isValid);

  @override
  List<Object> get props => [userName, email, password, formStatus, isValid];
}

//final class RegisterInitial extends RegisterState {}
