import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//Propio
import 'package:flutter_2_forms_app/presentation/blocs/register_cubit/register_cubit.dart';
import 'package:flutter_2_forms_app/presentation/widgets/widgets.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  //final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final registerCubit = context.watch<RegisterCubit>();
    final username = registerCubit.state.userName;
    final password = registerCubit.state.password;
    final email = registerCubit.state.email;

    return Form(
      //key: _formkey,
      child: Column(children: [
        const SizedBox(
          height: 10,
        ),
        CustomTextForm(
          label: "Usuario",
          icon: (Icons.person_2_outlined),
          onChanged: registerCubit.userNameChanged,
          errorMessage: username.errorMessage,
          //validator: (value) {
          //  if (value == null || value.trim().isEmpty) return "Campo requerido";
          //  if (value.length < 6) return "Mas de 6 letras";
          //  return null;
          //},
        ),
        const SizedBox(
          height: 10,
        ),
        CustomTextForm(
          label: "Correo electronico",
          icon: Icons.mail_outlined,
          onChanged: registerCubit.emailChanged,
          errorMessage: email.errorMessage,
        ),
        const SizedBox(
          height: 10,
        ),
        CustomTextForm(
          label: "Contrasena",
          obscureText: true,
          icon: Icons.password_outlined,
          onChanged: registerCubit.passwordChanged,
          errorMessage: password.errorMessage,
        ),
        const SizedBox(
          height: 10,
        ),
        FilledButton.tonalIcon(
            onPressed: () {
              //final isValid = _formkey.currentState!.validate();
              //if (!isValid) return;
              registerCubit.onSubmit();
            },
            label: const Text("Crear un usuario"),
            icon: const Icon(Icons.save_alt_outlined)),
        const SizedBox(
          height: 30,
        )
      ]),
    );
  }
}
