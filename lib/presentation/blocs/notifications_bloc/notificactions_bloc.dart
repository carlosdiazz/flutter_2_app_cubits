import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_2_forms_app/firebase_options.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

//Propio
part 'notificactions_event.dart';
part 'notificactions_state.dart';

class NotificactionsBloc
    extends Bloc<NotificactionsEvent, NotificactionsState> {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  NotificactionsBloc() : super(NotificactionsState()) {
    //on<NotificactionsEvent>((event, emit) {
    //  // TODO: implement event handler
    //});
  }

  static Future<void> initializerFCM() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  void requestPermission() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: true,
      provisional: false,
      sound: true,
    );
    print("VER =>>>>>>>>>>>>>>>>>>>>>>>> ${settings.authorizationStatus}");
  }
}
