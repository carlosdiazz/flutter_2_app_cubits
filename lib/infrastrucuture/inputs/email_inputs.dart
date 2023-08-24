import 'package:formz/formz.dart';

// Define input validation errors
enum EmailInputError { empty, format }

// Extend FormzInput and provide the input type and error type.
class EmailInput extends FormzInput<String, EmailInputError> {
  static final RegExp emailReg =
      RegExp("^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+.[a-zA-Z]{2,}\$");

  //Valor inicial
  const EmailInput.pure() : super.pure('');

  //Va hacer el cambio
  const EmailInput.dirty({String value = ''}) : super.dirty(value);

  //Va a validar los errores
  @override
  EmailInputError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return EmailInputError.empty;

    if (!emailReg.hasMatch(value)) return EmailInputError.format;

    return null;
  }

  //Devolver si Hay Error
  String? get errorMessage {
    if (isValid || isPure) return null;

    if (displayError == EmailInputError.empty) return "El campo es requerido";
    if (displayError == EmailInputError.format) return "Formato invalido";
    return null;
  }
}
