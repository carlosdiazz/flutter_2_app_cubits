import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//Propio
import 'package:flutter_2_forms_app/domain/entitties/push_message.dart';
import 'package:flutter_2_forms_app/presentation/blocs/notifications_bloc/notificactions_bloc.dart';

class DetailsScreen extends StatelessWidget {
  final String pushMessageId;
  const DetailsScreen({super.key, required this.pushMessageId});

  @override
  Widget build(BuildContext context) {
    final PushMessage? message =
        context.watch<NotificactionsBloc>().getMessageById(pushMessageId);

    return Scaffold(
      appBar: AppBar(
        title: Text("Detalles Push"),
      ),
      body: (message != null)
          ? _DetailsView(message: message)
          : const Center(
              child: Text("Notificacion no existe"),
            ),
    );
  }
}

class _DetailsView extends StatelessWidget {
  final PushMessage message;
  const _DetailsView({required this.message});

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Column(
        children: [
          if (message.imageUrl != null) Image.network(message.imageUrl!),
          const SizedBox(
            height: 30,
          ),
          Text(
            message.title,
            style: textStyles.titleMedium,
          ),
          Text(message.body),
          const Divider(),
          Text(message.data.toString())
        ],
      ),
    );
  }
}
