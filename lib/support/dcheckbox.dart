import 'package:flutter/material.dart';
import 'package:kitkat/provider/provider.dart';

class DCheckBox extends StatelessWidget {
  final KitKatProvider kitKatProvider;
  const DCheckBox({
    Key? key,
    required this.kitKatProvider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      if (kitKatProvider.getNotificationStatus) {
        return Colors.purple.shade600;
      }
      return Colors.black45;
    }

    return Checkbox(
      checkColor: Colors.white,
      fillColor: MaterialStateProperty.resolveWith(getColor),
      value: kitKatProvider.getNotificationStatus,
      onChanged: (bool? value) {
        kitKatProvider.changeNotificationStatus(value ?? true);
      },
    );
  }
}
