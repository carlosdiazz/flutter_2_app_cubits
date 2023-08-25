import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//Propio
import 'package:flutter_2_forms_app/config/router/app_router.dart';
import 'package:flutter_2_forms_app/config/theme/app_theme.dart';
import 'package:flutter_2_forms_app/presentation/blocs/notifications_bloc/notificactions_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //Recibir notificaciones con la app Cerrada
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  await NotificactionsBloc.initializerFCM();
  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (context) => NotificactionsBloc(),
    )
  ], child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = AppThemeCustom(isDarkMode: true, selectColor: 3);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: appTheme.getTheme(),
      routerConfig: appRouter,
    );
  }
}
