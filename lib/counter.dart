import 'notification_service.dart';
import 'main.dart';

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
  if (curr <= 2) {
    NotificationService()
        .showNotification(2, 'Kitkat', 'You get a kitkat in $curr days');
  }
  // print('Hello');
  box.put('days', curr);
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
    box.put('next_date', inputDate);
  }
  var days = box.get('days') ?? DateTime.now().day;
  // print('Counter->initializeDays Days: $days');
  setDays(inputDate);
}
