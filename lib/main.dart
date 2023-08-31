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
      builder: (context, child) =>
          HandleNotificationInteractions(child: child!),
    );
  }
}

class HandleNotificationInteractions extends StatefulWidget {
  final Widget child;
  const HandleNotificationInteractions({super.key, required this.child});

  @override
  State<HandleNotificationInteractions> createState() =>
      _HandleNotificationInteractionsState();
}

class _HandleNotificationInteractionsState
    extends State<HandleNotificationInteractions> {
  // It is assumed that all messages contain a data field with the key 'type'
  Future<void> setupInteractedMessage() async {
    // Get any messages which caused the application to open from
    // a terminated state.
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    // If the message also contains a data property with a "type" of "chat",
    // navigate to a chat screen
    if (initialMessage != null) {
      _handleMessage(initialMessage);
    }

    // Also handle any interaction when the app is in the background via a
    // Stream listener
    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
  }

  void _handleMessage(RemoteMessage message) {
    context.read<NotificactionsBloc>().handleRemoteMessage(message);
    final messageId =
        message.messageId?.replaceAll(":", "").replaceAll("%", "");
    appRouter.push("${AppRoutes.pushDatailsScreen}/$messageId");
    //if (message.data['type'] == 'chat') {
    //  Navigator.pushNamed(context, '/chat',
    //    arguments: ChatArguments(message),
    //  );
    //}
  }

  @override
  void initState() {
    super.initState();

    // Run code required to handle interacted messages in an async function
    // as initState() must not be async
    setupInteractedMessage();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
