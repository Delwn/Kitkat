import 'package:flutter/material.dart';
import 'package:kitkat/pages/settings.dart';
import 'package:kitkat/provider/provider.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    var kitKatProvider = Provider.of<KitKatProvider>(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var kitKatProvider = Provider.of<KitKatProvider>(context);
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
                  Center(
                    child: Text(
                      kitKatProvider.getCurr.toString(),
                      style: const TextStyle(
                          fontFamily: 'Rubik',
                          fontSize: 80,
                          color: Color.fromARGB(255, 240, 238, 243)),
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
                  kitKatProvider.setTime();
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
                kitKatProvider.datePicker(context);
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
