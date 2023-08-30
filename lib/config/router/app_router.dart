import 'package:go_router/go_router.dart';

//Propio
import 'package:flutter_2_forms_app/presentation/screens/screens.dart';

class AppRoutes {
  static const String home = "/";
  static const String cubitCounter = "/cubits";
  static const String blocCounter = "/counter-bloc";
  static const String registerScreen = "/register";
  static const String notificationsScreen = "/notificationsScreen";
  static const String pushDatailsScreen = "/pushDatailsScreen";
}

final appRouter = GoRouter(routes: [
  GoRoute(
    path: AppRoutes.home,
    builder: (context, state) => const HomeScreen(),
  ),
  GoRoute(
    path: AppRoutes.cubitCounter,
    builder: (context, state) => const CubitCounterScreen(),
  ),
  GoRoute(
    path: AppRoutes.blocCounter,
    builder: (context, state) => const BlocCounterScreen(),
  ),
  GoRoute(
    path: AppRoutes.registerScreen,
    builder: (context, state) => const RegisterScreen(),
  ),
  GoRoute(
    path: AppRoutes.notificationsScreen,
    builder: (context, state) => const NotificationsScreen(),
  ),
  GoRoute(
    path: "${AppRoutes.pushDatailsScreen}/:messageId",
    builder: (context, state) => DetailsScreen(
      pushMessageId: state.pathParameters["messageId"] ?? "404",
    ),
  )
]);
