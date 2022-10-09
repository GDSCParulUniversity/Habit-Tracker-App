import 'package:flutter/material.dart';

import 'package:habit_tracker_app/screens/screens.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => SplashScreen(),
      );
    case TrackScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => TrackScreen(),
      );
    default:
      return MaterialPageRoute(
        builder: (_) => ErrorScreen(
          error: settings.name!,
        ),
      );
  }
}

class ErrorScreen extends StatelessWidget {
  final String error;
  const ErrorScreen({
    Key? key,
    required this.error,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('$error is not defined'),
      ),
    );
  }
}
