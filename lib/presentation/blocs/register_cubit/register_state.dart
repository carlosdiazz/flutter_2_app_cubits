part of 'register_cubit.dart';

enum FormStatus { invalid, valid, valideting, posting }

class RegisterState extends Equatable {
  const RegisterState(
      {this.userName = "",
      this.email = "",
      this.password = "",
      this.formStatus = FormStatus.invalid});
  final String userName;
  final String email;
  final String password;
  final FormStatus formStatus;

  RegisterState copyWith(
          {String? userName,
          String? email,
          String? password,
          FormStatus? formStatus}) =>
      RegisterState(
          email: email ?? this.email,
          formStatus: formStatus ?? this.formStatus,
          password: password ?? this.password,
          userName: userName ?? this.userName);

  @override
  List<Object> get props => [userName, email, password, formStatus];
}

//final class RegisterInitial extends RegisterState {}
