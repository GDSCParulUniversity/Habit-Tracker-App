import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:habit_tracker_app/common/constants/theme.dart';
import 'package:habit_tracker_app/routes/router.dart';
import 'package:habit_tracker_app/screens/screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(380, 720),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Habit Tracker App',
          darkTheme: darkTheme(),
          theme: lightTheme(),
          initialRoute: TrackScreen.routeName,
          onGenerateRoute: generateRoute,
          home: child,
        );
      },
    );
  }
}
