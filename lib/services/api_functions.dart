import 'dart:convert';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:task_1/services/model.dart';
import 'package:http/http.dart' as http;

class ApiFunctions extends GetxController {
  static const String apiUrl =
      "https://raw.githubusercontent.com/shabeersha/test-api/main/test-notifications.json";

  // Reactive list to store notifications
  var notifications = <NotificationModel>[].obs;

  // Reactive loading state
  var isLoading = false.obs;

  // Fetch notifications and update the reactive list
  Future<void> fetchNotifications() async {
    isLoading.value = true; // Start loading
    try {
      final response = await http.get(Uri.parse(apiUrl));
      // print('Response: ${response.body}'); // Debug API response
      if (response.statusCode == 200) {
        // Parse the response as a map
        final decoded = json.decode(response.body) as Map<String, dynamic>;

        // Extract the list from the "data" key
        final results = decoded['data'] as List<dynamic>?;

        if (results == null || results.isEmpty) {
          notifications.clear(); // Clear the list if no data
          // print('No data available.');
        } else {
          notifications.value =
              results.map((data) => NotificationModel.fromJson(data)).toList();
          // print('Notifications: ${notifications.value}');
        }
      } else {
        throw Exception(
            'Failed to fetch data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // print('Error: $e'); // Debug the error
      throw Exception('Error fetching notifications: $e');
    } finally {
      isLoading.value = false; // Stop loading
    }
  }

  String getFormattedTimestamp(String timestamp) {
    try {
      final dateTime =
          DateTime.parse(timestamp); // Parse the ISO-8601 timestamp
      return DateFormat('dd/MM/yyyy')
          .format(dateTime); // Format as '11/12/2024'
    } catch (e) {
      return timestamp; // Return original if parsing fails
    }
  }

  // Method to get the full image URL
  String getFullImageUrl(String image) {
    // const baseUrl = "https://raw.githubusercontent.com/shabeersha/test-api/main/";
    return '$apiUrl$image'; // Combine base URL with the image file name
  }
}
