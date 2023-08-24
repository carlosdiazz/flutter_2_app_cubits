import 'package:formz/formz.dart';

// Define input validation errors
enum UsernameInputError { empty, length }

// Extend FormzInput and provide the input type and error type.
class UsernameInput extends FormzInput<String, UsernameInputError> {
  //Valor inicial
  const UsernameInput.pure() : super.pure('');

  //Va hacer el cambio
  const UsernameInput.dirty({String value = ''}) : super.dirty(value);

  //Va a validar los errores
  @override
  UsernameInputError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return UsernameInputError.empty;
    if (value.length < 6) return UsernameInputError.length;

    return null;
  }

  //Devolver si Hay Error
  String? get errorMessage {
    if (isValid || isPure) return null;

    if (displayError == UsernameInputError.empty)
      return "El campo es requerido";

    if (displayError == UsernameInputError.length) return "Minimo 6 caracteres";

    return null;
  }
}
