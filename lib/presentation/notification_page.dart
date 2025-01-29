import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_1/services/api_functions.dart';

final notificationProvider = StateNotifierProvider<ApiFunctions, NotificationState>(
  (ref) => ApiFunctions(),
);

class NotificationPage extends ConsumerWidget {
  final String data;
  const NotificationPage({super.key, required this.data});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(notificationProvider.notifier);
    final state = ref.watch(notificationProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_circle_left,
            color: Colors.green,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Builder(
        builder: (context) {
          if (state.isLoading) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.green[400],
              ),
            );
          } else if (state.errorMessage.isNotEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    state.errorMessage,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.red,
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      notifier.fetchNotifications();
                    },
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          } else if (state.notifications.isEmpty) {
            return const Center(
              child: Text('No notifications available.'),
            );
          } else {
            return ListView.separated(
              separatorBuilder: (context, index) => const Divider(
                thickness: 1,
              ),
              itemBuilder: (context, index) {
                final notification = state.notifications[index];
                final time =
                    notifier.getFormattedTimestamp(notification.timeStamp);
                return ListTile(
                  leading:  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Image.asset("assets/images/${notification.image}"),
                  ),
                  title: Text(notification.title),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(notification.body),
                      const SizedBox(height: 10),
                      Text(time),
                    ],
                  ),
                  isThreeLine: true,
                );
              },
              itemCount: state.notifications.length,
            );
          }
        },
      ),
    );
  }
}
