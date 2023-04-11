import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:kitkat/pages/settings.dart';
import 'package:kitkat/provider/provider.dart';
import 'package:provider/provider.dart';

import '../support/neu_button.dart';

class NeuHomePage extends StatefulWidget {
  const NeuHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<NeuHomePage> createState() => NeuHomePageState();
}

class NeuHomePageState extends State<NeuHomePage> {
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
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        title: Column(
          children: <Widget>[
            const SizedBox(
              height: 20,
            ),
            Text(
              widget.title,
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 40,
                  color: Colors.purple.shade500),
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
            Center(
              child: Container(
                alignment: Alignment.center,
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  //borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.grey.shade300,
                  boxShadow: const [
                    BoxShadow(
                      //down
                      color: Color.fromARGB(255, 180, 180, 180),
                      offset: Offset(6, 6),
                      blurRadius: 15,
                      spreadRadius: 1,
                      inset: true,
                    ),
                    BoxShadow(
                      //top
                      color: Color.fromARGB(255, 244, 244, 244),
                      offset: Offset(-4, -4),
                      blurRadius: 15,
                      spreadRadius: 1,
                      inset: true,
                    ),
                  ],
                ),
                child: Text(
                  kitKatProvider.getCurr.toString(),
                  style: const TextStyle(
                      fontFamily: 'Rubik', fontSize: 80, color: Colors.purple),
                ),
              ),
            ),
            const SizedBox(
              height: 150,
            )
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          NeuButtonCircle(
            icon: Icons.replay_sharp,
            onTap: () {
              kitKatProvider.setTime();
            },
          ),
          const SizedBox(
            height: 20,
          ),
          NeuButtonCircle(
            icon: Icons.calendar_month,
            onTap: () {
              kitKatProvider.datePicker(context);
            },
          ),
          const SizedBox(
            height: 20,
          ),
          NeuButtonCircle(
            icon: Icons.settings,
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SettingsScreen()));
            },
          ),
        ],
      ),
    );
  }
}
