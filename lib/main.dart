import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'package:flutter/material.dart';
import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'counter.dart';
import 'notification_service.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'settings.dart';

late Box box;
const int kitkatAlarmID = 0;
int curr = 0;
main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService().init();

  await Hive.initFlutter();
  box = await Hive.openBox('hive_box');
  box = Hive.box('hive_box');

  await AndroidAlarmManager.initialize();

  // count();

  runApp(const MyApp());
  AndroidAlarmManager.periodic(
    const Duration(hours: 24),
    kitkatAlarmID,
    count,
    startAt: DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day, 0, 0),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KitKat v1.0',
      theme: ThemeData.dark(),
      home: const MyHomePage(title: 'KitKat'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => MyHomePageState();
}

Future<int> setTime() async {
  var days = box.get('days') ?? DateTime.now().day;
  // print('setTime Days: $days');
  curr = days;
  //print('setTime $curr');
  return curr;
}

class MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    count();
    setState(() {});
  }

  void datePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime(2050),
    ).then((value) {
      count(value);
      // print("Datepicker");
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/bgimg.jpg"), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Column(
            children: <Widget>[
              const SizedBox(
                height: 20,
              ),
              Text(
                widget.title,
                style: const TextStyle(
                    fontFamily: 'Poppins', fontSize: 40, color: Colors.white60),
              ),
            ],
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Stack(
                alignment: Alignment.center,
                children: [
                  BlurryContainer(
                    blur: 0,
                    height: 150,
                    width: 150,
                    color: Colors.transparent,
                    borderRadius: const BorderRadius.all(Radius.circular(100)),
                    child: Center(
                      child: Text(
                        '$curr',
                        style: const TextStyle(
                            fontFamily: 'Rubik',
                            fontSize: 80,
                            color: Color.fromARGB(255, 240, 238, 243)),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.transparent,
              ),
              child: IconButton(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.all(0),
                iconSize: 57,
                onPressed: () {
                  setTime();
                  setState(() {});
                },
                icon: Image.asset("assets/reset_small.png"),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            IconButton(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.all(0),
              iconSize: 57,
              onPressed: () {
                datePicker();
                setState(() {});
              },
              icon: Image.asset("assets/calendar_small.png"),
            ),
            const SizedBox(
              height: 10,
            ),
            IconButton(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.all(0),
                iconSize: 57,
                icon: Image.asset(
                  "assets/settings_small.png",
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SettingsScreen()));
                }),
          ],
        ),
      ),
    );
  }
}
