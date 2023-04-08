import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:kitkat/support/slider_gradient.dart';
import '../provider/provider.dart';

class NotificationDaysCard extends StatelessWidget {
  const NotificationDaysCard({
    Key? key,
    required this.kitKatProvider,
  }) : super(key: key);

  final KitKatProvider kitKatProvider;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 500,
      padding: const EdgeInsets.only(left: 20, right: 20),
      margin: const EdgeInsets.only(left: 20, right: 20),
      decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: const BorderRadius.all(Radius.circular(50)),
          boxShadow: const [
            BoxShadow(
              //down
              color: Color.fromARGB(255, 180, 180, 180),
              offset: Offset(6, 6),
              blurRadius: 15,
              spreadRadius: 1,
            ),
            BoxShadow(
              //top
              color: Color.fromARGB(255, 244, 244, 244),
              offset: Offset(-4, -4),
              blurRadius: 15,
              spreadRadius: 1,
            )
          ]),
      child: Row(
        children: <Widget>[
          const Text(
            'Notify before',
            style: TextStyle(color: Colors.black38, fontFamily: 'Poppins'),
          ),
          SliderTheme(
            data: SliderThemeData(
                trackShape: const GradientSliderTrackShape(),
                trackHeight: 10,
                inactiveTrackColor: const Color.fromARGB(195, 189, 189, 189),
                thumbColor: Colors.purple.shade400,
                overlayColor: const Color.fromARGB(65, 155, 39, 176)),
            child: Slider(
                value: kitKatProvider.getNotifyDays.toDouble(),
                min: 1,
                max: 10,
                onChanged: (value) {
                  kitKatProvider.changeNotifyDays(value.toInt());
                }),
          ),
          Text(
            kitKatProvider.getNotifyDays.toString(),
            style: const TextStyle(
                color: Colors.purple,
                fontFamily: 'Rubik',
                fontWeight: FontWeight.bold),
          ),
          const Text(
            " days",
            style: TextStyle(color: Colors.black38, fontFamily: 'Poppins'),
          )
        ],
      ),
    );
  }
}
