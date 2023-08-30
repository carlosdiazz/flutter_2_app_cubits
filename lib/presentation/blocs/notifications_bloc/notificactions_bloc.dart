import "dart:io";
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_2_forms_app/firebase_options.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

//Propio
import 'package:flutter_2_forms_app/domain/entitties/push_message.dart';
part 'notificactions_event.dart';
part 'notificactions_state.dart';

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();

  print("Handling a background message: ${message.messageId}");
}

class NotificactionsBloc
    extends Bloc<NotificactionsEvent, NotificactionsState> {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  NotificactionsBloc() : super(NotificactionsState()) {
    on<NotificactionStatusChanged>(_notificationsStatusChanged);
    on<NotificationRecived>(_onPushMessageReceived);

    //*Tan pronto la app Abra le saldra
    //requestPermission();

    //*Verificar estado de las notificaciones
    _initialStatusCheck();

    //* Listener para notificaciones en Foreground
    _onForegroundMessage();
    _getFCMToken();
  }

  static Future<void> initializerFCM() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  void _initialStatusCheck() async {
    final settings = await messaging.getNotificationSettings();
    add(NotificactionStatusChanged(settings.authorizationStatus));
  }

  void _getFCMToken() async {
    final settings = await messaging.getNotificationSettings();
    if (settings.authorizationStatus != AuthorizationStatus.authorized) return;
    //Otra forma de hacerlo
    if (state.status != AuthorizationStatus.authorized) return;

    final token = await messaging.getToken();
    print(token);
  }

  void _handleRemoteMessage(RemoteMessage message) {
    print("Entro");
    if (message.notification == null) return;

    print("Por aca");
    final notification = PushMessage(
        messageId:
            message.messageId?.replaceAll(":", "").replaceAll("%", "") ?? "",
        title: message.notification!.title ?? "",
        body: message.notification!.body ?? "",
        sentDate: message.sentTime ?? DateTime.now(),
        data: message.data,
        imageUrl: Platform.isAndroid
            ? message.notification!.android?.imageUrl
            : message.notification!.apple?.imageUrl);
    print(notification);
    add(NotificationRecived(notification));
  }

  void _onForegroundMessage() {
    print("ENTROoooooooooooooooo");
    FirebaseMessaging.onMessage.listen(_handleRemoteMessage);
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
    add(NotificactionStatusChanged(settings.authorizationStatus));
    print("VER =>>>>>>>>>>>>>>>>>>>>>>>> ${settings.authorizationStatus}");
  }

  void _notificationsStatusChanged(
      NotificactionStatusChanged event, Emitter<NotificactionsState> emit) {
    emit(state.copyWith(status: event.status));
    _getFCMToken();
  }

  void _onPushMessageReceived(
      NotificationRecived event, Emitter<NotificactionsState> emit) {
    emit(state
        .copyWith(notifications: [event.pushMessage, ...state.notifications]));
    _getFCMToken();
  }

  PushMessage? getMessageById(String pushMessageId) {
    //Devuelvo pri,er elemento que cumpla esta condicion
    final exist = state.notifications
        .any((element) => element.messageId == pushMessageId);
    if (!exist) return null;
    return state.notifications
        .firstWhere((element) => element.messageId == pushMessageId);
  }
}
