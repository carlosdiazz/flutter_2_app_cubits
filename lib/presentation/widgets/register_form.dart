import 'package:flutter/material.dart';
import 'package:flutter_2_forms_app/presentation/blocs/register_cubit/register_cubit.dart';
import 'package:flutter_2_forms_app/presentation/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  //String username = "";
  //String email = "";
  //String password = "";

  @override
  Widget build(BuildContext context) {
    final registerCubit = context.watch<RegisterCubit>();

    return Form(
      key: _formkey,
      child: Column(children: [
        const SizedBox(
          height: 10,
        ),
        CustomTextForm(
          label: "Nombre de usuario",
          icon: (Icons.person_2_outlined),
          onChanged: (value) {
            registerCubit.userNameChanged(value);
            _formkey.currentState?.validate();
          },
          validator: (value) {
            if (value == null || value.trim().isEmpty) return "Campo requerido";
            if (value.length < 6) return "Mas de 6 letras";
            return null;
          },
        ),
        const SizedBox(
          height: 10,
        ),
        CustomTextForm(
          label: "Correo electronico",
          icon: Icons.mail_outlined,
          onChanged: (value) {
            registerCubit.emailChanged(value);
            _formkey.currentState?.validate();
          },
          validator: (value) {
            if (value == null || value.trim().isEmpty) return "Campo requerido";
            final emialReg =
                RegExp("^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+.[a-zA-Z]{2,}\$");
            if (!emialReg.hasMatch(value)) return "No tiene formato de correo";
            return null;
          },
        ),
        const SizedBox(
          height: 10,
        ),
        CustomTextForm(
          label: "Contrasena",
          obscureText: true,
          icon: Icons.password_outlined,
          onChanged: (value) {
            registerCubit.passwordChanged(value);
            _formkey.currentState?.validate();
          },
          validator: (value) {
            if (value == null || value.trim().isEmpty) return "Campo requerido";
            if (value.length < 6) return "Mas de 6 letras";
            return null;
          },
        ),
        const SizedBox(
          height: 10,
        ),
        FilledButton.tonalIcon(
            onPressed: () {
              final isValid = _formkey.currentState!.validate();
              if (!isValid) return;
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
