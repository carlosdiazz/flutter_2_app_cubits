part of 'notificactions_bloc.dart';

class NotificactionsState extends Equatable {
  final AuthorizationStatus status;
  //TODO
  final List<PushMessage> notifications;

  //*Clase
  const NotificactionsState({
    this.status = AuthorizationStatus.notDetermined,
    this.notifications = const [],
  });

  NotificactionsState copyWith(
          {AuthorizationStatus? status, List<PushMessage>? notifications}) =>
      NotificactionsState(
          notifications: notifications ?? this.notifications,
          status: status ?? this.status);

  @override
  List<Object> get props => [status, notifications];
}

//final class NotificactionsInitial extends NotificactionsState {}
