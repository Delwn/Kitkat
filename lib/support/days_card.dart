import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:kitkat/support/slider_gradient.dart';
import '../provider/provider.dart';

class DaysCard extends StatelessWidget {
  const DaysCard({
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
            'Cycle Days',
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
                value: kitKatProvider.getCurrentCycleDays.toDouble(),
                min: 20,
                max: 40,
                onChanged: (value) {
                  kitKatProvider.changeCycle(value.toInt());
                }),
          ),
          // NeumorphicSlider(
          //   min: 20,
          //   max: 40,
          //   value: kitKatProvider.getCurrentCycleDays.toDouble(),
          //   onChanged: (value) {
          //     kitKatProvider.changeCycle(value.toInt());
          //   },
          // ),
          Text(
            kitKatProvider.getCurrentCycleDays.toString(),
            style: const TextStyle(color: Colors.purple, fontFamily: 'Rubik'),
          )
          // NumberPicker(
          //     minValue: 0,
          //     maxValue: 35,
          //     itemHeight: 35,
          //     value: kitKatProvider.currentCycleDays,
          //     textStyle: const TextStyle(color: Colors.white54),
          //     onChanged: (value) {
          //       kitKatProvider.changeCycle(value);
          //     })
        ],
      ),
    );
  }
}
