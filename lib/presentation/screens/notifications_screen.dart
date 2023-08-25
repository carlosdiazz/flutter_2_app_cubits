import 'package:flutter/material.dart';
import 'package:flutter_2_forms_app/presentation/blocs/notifications_bloc/notificactions_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final notificacionBloc = context.watch<NotificactionsBloc>().state;
    return Scaffold(
      appBar: AppBar(
        title: Text(notificacionBloc.status.toString()),
        actions: [
          IconButton(
              onPressed: () {
                context.read<NotificactionsBloc>().requestPermission();
              },
              icon: Icon(Icons.settings))
        ],
      ),
      body: _View(),
    );
  }
}

class _View extends StatelessWidget {
  const _View();

  @override
  Widget build(BuildContext context) {
    final notificacions =
        context.watch<NotificactionsBloc>().state.notifications;

    return ListView.builder(
      itemCount: notificacions.length,
      itemBuilder: (context, index) {
        final notification = notificacions[index];
        return ListTile(
          title: Text(notification.title),
          subtitle: Text(notification.body),
          leading: Text(""),
        );
      },
    );
  }
}
