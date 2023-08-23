import 'package:go_router/go_router.dart';

//Propio
import 'package:flutter_2_forms_app/presentation/screens/screens.dart';

final appRouter = GoRouter(routes: [
  GoRoute(
    path: "/",
    builder: (context, state) => const HomeScreen(),
  ),
  GoRoute(
    path: "/cubits",
    builder: (context, state) => const CubitCounterScreen(),
  )
]);
