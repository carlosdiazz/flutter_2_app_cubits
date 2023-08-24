import 'package:formz/formz.dart';

// Define input validation errors
enum PasswordInputError { empty, length }

// Extend FormzInput and provide the input type and error type.
class PasswordInput extends FormzInput<String, PasswordInputError> {
  //Valor inicial
  const PasswordInput.pure() : super.pure('');

  //Va hacer el cambio
  const PasswordInput.dirty({String value = ''}) : super.dirty(value);

  //Va a validar los errores
  @override
  PasswordInputError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return PasswordInputError.empty;
    if (value.length < 6) return PasswordInputError.length;

    return null;
  }

  //Devolver si Hay Error
  String? get errorMessage {
    if (isValid || isPure) return null;

    if (displayError == PasswordInputError.empty)
      return "El campo es requerido";

    if (displayError == PasswordInputError.length) return "Minimo 6 caracteres";

    return null;
  }
}
