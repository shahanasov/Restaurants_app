import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:task_1/services/model.dart';

class ApiFunctions extends StateNotifier<NotificationState> {
  ApiFunctions() : super(NotificationState.initial());

  static const String apiUrl =
      "https://raw.githubusercontent.com/shabeersha/test-api/main/test-notifications.json";

  // Fetch notifications from the API
Future<void> fetchNotifications() async {
  state = state.copyWith(isLoading: true); // Start loading
  try {
    final response = await http.get(Uri.parse(apiUrl));
    // Log the response body for debugging
    // print('Response: ${response.body}'); 

    if (response.statusCode == 200) {
      final decoded = json.decode(response.body) as Map<String, dynamic>;

      // Extract the list from the "data" key
      final results = decoded['data'] as List<dynamic>?;

      if (results != null && results.isNotEmpty) {
        // Map the list of notifications
        final notifications = results.map((data) => NotificationModel.fromJson(data)).toList();

        // Update the state with notifications
        state = state.copyWith(notifications: notifications, isLoading: false);
      } else {
        // No notifications available, clear the list
        state = state.copyWith(notifications: [], isLoading: false);
      }
    } else {
      throw Exception('Failed to fetch data. Status code: ${response.statusCode}');
    }
  } catch (e) {
    // print('Error: $e'); // Debugging
    throw Exception('Error fetching notifications: $e');
  } finally {
    state = state.copyWith(isLoading: false); // Stop loading
  }
}




  String getFormattedTimestamp(String timestamp) {
    try {
      final dateTime = DateTime.parse(timestamp);
      return DateFormat('dd/MM/yyyy').format(dateTime);
    } catch (e) {
      return timestamp;
    }
  }

  // String getFullImageUrl(String image) {
  //   return '$apiUrl$image';
  // }
}

// Notification state class
class NotificationState {
  final List<NotificationModel> notifications;
  final bool isLoading;

  NotificationState({
    required this.notifications,
    required this.isLoading,
  });

  // Initial state
  factory NotificationState.initial() {
    return NotificationState(notifications: [], isLoading: false);
  }

  // Copy method to update the state immutably
  NotificationState copyWith({
    List<NotificationModel>? notifications,
    bool? isLoading,
  }) {
    return NotificationState(
      notifications: notifications ?? this.notifications,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

// Provider for the ApiFunctions
final notificationProvider =
    StateNotifierProvider<ApiFunctions, NotificationState>(
  (ref) => ApiFunctions(),
);
