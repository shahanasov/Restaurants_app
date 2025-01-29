import 'dart:convert';
import 'dart:isolate';
import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:task_1/services/model.dart';
import 'package:timeago/timeago.dart' as timeago;


class ApiFunctions extends StateNotifier<NotificationState> {
  ApiFunctions() : super(NotificationState.initial());

  static const String apiUrl =
      "https://raw.githubusercontent.com/shabeersha/test-api/main/test-notifications.json";

  // Fetch notifications from the API
Future<void> fetchNotifications() async {
  state = state.copyWith(isLoading: true, errorMessage: ''); // Start loading and clear previous error message

  try {
    final response = await http.get(Uri.parse(apiUrl));

    // Check for different status codes
    if (response.statusCode == 200) {
      try {
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
      } catch (e) {
        // Handle JSON parsing errors
        state = state.copyWith(
          isLoading: false,
          errorMessage: 'Error parsing data. Please try again later.', // Specific error message
        );
        throw Exception('Error parsing JSON: $e');
      }
    } else {
      // Handle non-200 status codes (e.g., 404, 500)
      String errorMessage = '';
      switch (response.statusCode) {
        case 404:
          errorMessage = 'Data not found. Please check your request.';
          break;
        case 500:
          errorMessage = 'Server error. Please try again later.';
          break;
        default:
          errorMessage = 'Failed to fetch data. Status code: ${response.statusCode}';
      }

      state = state.copyWith(
        errorMessage: errorMessage, // Set error message in state
        isLoading: false,
      );
      throw Exception('Failed to fetch data. Status code: ${response.statusCode}');
    }
  } catch (e) {
    // Handle network or other errors
    String errorMessage = '';
    if (e is SocketException) {
      errorMessage = 'Network connection lost. Please check your internet connection.';
    } else {
      errorMessage = 'Error fetching notifications: $e';
    }

    state = state.copyWith(
      isLoading: false,
      errorMessage: errorMessage, // Set error message in state
    );
    throw Exception('Error fetching notifications: $e');
  } finally {
    state = state.copyWith(isLoading: false); // Stop loading
  }
}






String getFormattedTimestamp(String timestamp) {
  try {
    final dateTime = DateTime.parse(timestamp);
    return timeago.format(dateTime, locale: 'en');
  } catch (e) {
    return timestamp;
  }
}


 // Helper function to parse notifications in an isolate
// Function to parse JSON in an isolate
Future<List<NotificationModel>> parseJsonInIsolate(String responseBody) async {
  final receivePort = ReceivePort();

  await Isolate.spawn(_isolateParseJson, [receivePort.sendPort, responseBody]);

  // Wait for the parsed data from the isolate
  return await receivePort.first as List<NotificationModel>;
}

// Entry point for the isolate
void _isolateParseJson(List<dynamic> args) {
  final sendPort = args[0] as SendPort;
  final responseBody = args[1] as String;

  try {
    // Parse the JSON
    final decoded = json.decode(responseBody) as Map<String, dynamic>;
    final results = decoded['data'] as List<dynamic>?;

    // Map results to NotificationModel
    final notifications = results?.map((data) => NotificationModel.fromJson(data)).toList() ?? [];

    // Send the result back to the main isolate
    sendPort.send(notifications);
  } catch (e) {
    // Send an empty list in case of error
    sendPort.send([]);
  }
}
}

// Notification state class
class NotificationState {
  final bool isLoading;
  final List<NotificationModel> notifications;
  final String errorMessage;

  // Constructor to initialize the state with values
  NotificationState({
    required this.isLoading,
    required this.notifications,
    required this.errorMessage,
  });

  // Initial state method to provide default values when the state is created
  factory NotificationState.initial() {
    return NotificationState(
      isLoading: false,
      notifications: [],
      errorMessage: '',
    );
  }

  // Copy method to create a new instance with updated values
  NotificationState copyWith({
    bool? isLoading,
    List<NotificationModel>? notifications,
    String? errorMessage,
  }) {
    return NotificationState(
      isLoading: isLoading ?? this.isLoading,
      notifications: notifications ?? this.notifications,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  
}


