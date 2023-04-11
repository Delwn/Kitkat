import 'package:flutter/material.dart';

class NeuButtonCircle extends StatelessWidget {
  final void Function()? onTap;
  final IconData icon;
  const NeuButtonCircle({
    Key? key,
    required this.onTap,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 80,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey.shade300,
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
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Icon(
            icon,
            color: Colors.purple.shade700,
          ),
        ),
      ),
    );
  }
}
