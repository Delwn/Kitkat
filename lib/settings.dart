import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'main.dart';

class SettingsScreen extends StatefulWidget {
  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late int currentCycleDays;

  @override
  void initState() {
    getCurrentValue();
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 255, 255, 255),
      ),
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
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Container(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(10, 10),
                          blurRadius: 6,
                          spreadRadius: 1,
                        ),
                        BoxShadow(
                          color: Colors.white12,
                          offset: Offset(-10, -10),
                          blurRadius: 6,
                          spreadRadius: 1,
                        )
                      ]),
                  child: Row(
                    children: <Widget>[
                      const Text(
                        'Cycle days',
                        style: TextStyle(color: Colors.black),
                      ),
                      NumberPicker(
                          minValue: 20,
                          maxValue: 35,
                          value: currentCycleDays,
                          onChanged: (value) {
                            changeCycle(value);
                            setState(() {});
                          })
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void changeCycle(int value) {
    box.put('cycle_days', value);
    currentCycleDays = value;
  }

  void getCurrentValue() {
    currentCycleDays = box.get('cycle_days') ?? -1;
    if (currentCycleDays == -1) {
      box.put('cycle_days', '30');
      currentCycleDays = 30;
    }
  }
}
