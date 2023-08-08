import 'package:flutter/material.dart';
import 'package:kitkat/support/notification_card.dart';
import 'package:provider/provider.dart';
import '../provider/provider.dart';
import '../support/days_card.dart';
import '../support/dcheckbox.dart';

class SettingsScreen extends StatefulWidget {
  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var kitKatProvider = Provider.of<KitKatProvider>(context);
    return Container(
      decoration: BoxDecoration(color: Colors.grey[300]),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text('Settings'),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 80),
                child: DaysCard(kitKatProvider: kitKatProvider),
              ),
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Row(
                  children: [
                    const Text(
                      "Enable notifications",
                      style: TextStyle(
                          fontFamily: 'Poppins', color: Colors.black38),
                    ),
                    const SizedBox(
                      width: 0,
                    ),
                    DCheckBox(kitKatProvider: kitKatProvider),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: NotificationDaysCard(
                  kitKatProvider: kitKatProvider,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
