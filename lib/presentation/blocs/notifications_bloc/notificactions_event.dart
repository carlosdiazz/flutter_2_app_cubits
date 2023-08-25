part of 'notificactions_bloc.dart';

abstract class NotificactionsEvent extends Equatable {
  const NotificactionsEvent();

  @override
  List<Object> get props => [];
}

class NotificactionStatusChanged extends NotificactionsEvent {
  final AuthorizationStatus status;
  NotificactionStatusChanged(this.status);
}

class NotificationRecived extends NotificactionsEvent {
  final PushMessage pushMessage;
  NotificationRecived(this.pushMessage);
}
