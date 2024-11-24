import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_1/services/api_functions.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ApiFunctions controller = Get.put(ApiFunctions());
     
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
      body: Obx(() {
        if (controller.isLoading.value || controller.notifications.isEmpty) {
          return Center(
            child: CircularProgressIndicator(
              color: Colors.green[400],
            ),
          );
        }

        return ListView.separated(
          separatorBuilder: (context, index) => const Divider(
            thickness: 1,
          ),
          itemBuilder: (context, index) {
            final notification = controller.notifications[index];
            String time=controller. getFormattedTimestamp(notification.timeStamp);
            String image=controller. getFullImageUrl(notification.image);
            return ListTile(
              leading:  CircleAvatar(
                backgroundImage: NetworkImage(image),
                backgroundColor: Colors.white,
              ),
              title: Text(notification.title),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(notification.body),
                  Text(time)
                ],
              ),
              isThreeLine: true,
            );
          },
          itemCount: controller.notifications.length,
        );
      }),
    );
  }
}
