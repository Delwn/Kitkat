import 'package:flutter/material.dart';
import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:kitkat/pages/homepage.dart';
import 'package:kitkat/pages/neu_homepage.dart';
import 'package:kitkat/provider/provider.dart';
import 'components/notification_service.dart';
import 'package:provider/provider.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService().init();
  await AndroidAlarmManager.initialize();

  // count();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => KitKatProvider(),
      child: MaterialApp(
        title: 'KitKat v1.0',
        home: const NeuHomePage(title: 'KitKat'),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
