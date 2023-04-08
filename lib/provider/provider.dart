import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../components/notification_service.dart';

class KitKatProvider with ChangeNotifier {
  late Box box;
  int curr = 0;
  int kitkatAlarmID = 0;
  int currentCycleDays = 28;
  DateTime previousDate = DateTime.now(), nextDate = DateTime.now();

  KitKatProvider() {
    initBox();
  }

  int get getCurr => curr;
  DateTime get getPreviousDate => previousDate;
  DateTime get getNextDate => nextDate;
  int get getCurrentCycleDays => currentCycleDays;

  initBox() async {
    await Hive.initFlutter();
    box = await Hive.openBox('hive_box');
    box = Hive.box('hive_box');
    print("Box Initialized....");

    AndroidAlarmManager.periodic(
      const Duration(hours: 24),
      kitkatAlarmID,
      count,
      startAt: DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day, 0, 0),
    );
    count();
    print("Count completed....");
  }

  Future<int> setTime() async {
    var days = box.get('days') ?? DateTime.now().day;
    // print('setTime Days: $days');
    curr = days;
    //print('setTime $curr');
    notifyListeners();
    return curr;
  }

  void count([DateTime? inputDate]) async {
    //await Hive.initFlutter();
    //print("Count called $inputDate");
    //day = Hive.box('hive_box');
    initializeDays(inputDate);
  }

  void setDays([DateTime? inputDate]) {
    int curr;
    DateTime from = DateTime.now();
    // print("from has $inputDate");
    DateTime to = box.get('next_date');
    curr = daysBetween(from, to);
    // print("curr is $curr");
    if (curr < 0) {
      box.put('prev_date', to);
      previousDate = to;
      to = to.add(const Duration(days: 30));
      box.put('next_date', to);
      to = box.get('next_date');
      nextDate = to;
      curr = daysBetween(from, to);
    }

    // if (inputDate?.isAfter(DateTime.now()) ?? false) {
    //   DateTime prev = box.get('next_date');
    //   previousDate = prev;
    //   box.put('next_date', inputDate);
    //   box.put('prev_date', prev);
    //   nextDate = inputDate ?? prev;
    // }

    if (curr <= 2) {
      NotificationService()
          .showNotification(2, 'Kitkat', 'You get a kitkat in $curr days');
    }
    // print('Hello');
    box.put('days', curr);
    notifyListeners();
    setTime();
  }

  int daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (to.difference(from).inHours / 24).round();
  }

  void initializeDays([DateTime? inputDate]) async {
    var nextDate = box.get('next_date');
    // print("Counter->initializeDays nextDate: $nextDate");
    if (nextDate == null) {
      box.put('next_date', DateTime.now().add(const Duration(days: 30)));
    }
    if (inputDate != null) {
      DateTime to = box.get('next_date');
      box.put('prev_date', to);
      previousDate = to;
      box.put('next_date', inputDate);
      nextDate = inputDate;
    }
    var days = box.get('days') ?? DateTime.now().day;
    // print('Counter->initializeDays Days: $days');
    notifyListeners();
    setDays(inputDate);
  }

  void datePicker(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime(2050),
    ).then((value) {
      count(value);
      // print("Datepicker");
    });
  }

  void changeCycle(int value) {
    print("Value: $value");
    box.put('cycle_days', value);
    currentCycleDays = value;
    print('Current cycle days: $currentCycleDays');
    notifyListeners();
  }

  void getCurrentValue() {
    currentCycleDays = box.get('cycle_days') ?? -1;
    if (currentCycleDays == -1) {
      box.put('cycle_days', '30');
      currentCycleDays = 30;
    }
    notifyListeners();
  }
}
