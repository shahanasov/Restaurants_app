Flutter Task

This Flutter application is designed as part of a technical assignment. It demonstrates the implementation of two screens (a Home Screen and a Notifications Screen) based on Figma mockups. The application fetches and displays JSON data from a provided API endpoint, with optional features for enhanced performance and testability.

Features
 Home Screen: Displays the main UI as per the Figma design.
 Notifications Screen: Fetches and displays data from a JSON API endpoint.
 Routing: Smooth navigation between the Home Screen and Notifications Screen.
 Error Handling: Graceful handling of network errors and invalid responses.
 Performance Optimization (Optional): Uses isolates for efficient JSON parsing.
 Unit Testing (Optional): Includes test cases for core functionality.

Resources
Figma Design: [View Design](https://www.figma.com/design/P0GZBbn6nAlDiBxEqvrsPm/Flutter-Assignment?node-id=0-1&t=KEtbQPmcKug67ifu-1)
API Endpoint: [View JSON](https://raw.githubusercontent.com/shabeersha/test-api/main/test-notifications.json)

Project Structure
The project follows a modular structure with separate directories for screens, services, models, and state management.

perl
Copy code
lib/
├── main.dart                 # Entry point of the app
├── screens/                  # Contains Home and Notifications screens
│   ├── home_screen.dart
│   └── notification_screen.dart
├── models/                   # Defines data models for JSON parsing
│   └── notification_model.dart
├── services/                 # Handles API requests and response parsing
│   └── api_service.dart
├── state/                    # Manages application state
│   └── notification_state.dart
└── widgets/                  # Reusable UI components
    └── refer_widget.dart

How to Run the Project

Prerequisites

Flutter SDK: Version 3.0+ installed on your system.
A connected device or emulator for testing.
Steps
Clone the Repository:

bash
Copy code
git clone https://github.com/shahanasov/Restaurants_app
cd your-repo-name
Install Dependencies:

bash
Copy code
flutter pub get
Run the App:

bash
Copy code
flutter run
Features Overview
1. Home Screen
Displays static or dynamic data as per the Figma design.
Provides a button to navigate to the Notifications screen.
2. Notifications Screen
Fetches data from the API endpoint and displays it in a list.
Includes proper error handling:
404 Error: Displays "No notifications available."
Network Errors: Displays "Network connection lost."
3. JSON Parsing
JSON data is parsed using a NotificationModel class.
(Optional) Uses Flutter isolates for better performance on large datasets.
4. Routing
Navigation between the Home Screen and Notifications Screen is implemented using Flutter's Navigator API.
Error Handling
HTTP Errors: Errors such as 404 or 500 are displayed to the user with descriptive messages.
Network Errors: Handles connectivity issues gracefully and displays a user-friendly message.
Dependencies
The following third-party packages are used in the project:

flutter_riverpod: State management.
http: For handling API requests.
flutter_test: For writing unit tests (optional).
Add these dependencies to your pubspec.yaml file.

Screenshots
Home Screen	Notifications Screen
Optional Enhancements
Isolates: Improve JSON parsing performance by running the process in a separate thread.
Unit Testing: Includes test cases for JSON parsing, API service, and UI widgets.
Contributing
Feel free to contribute by opening issues or submitting pull requests. Ensure that your code follows Flutter's best practices.

License
This project is licensed under the MIT License. See the LICENSE file for details.