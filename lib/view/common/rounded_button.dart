import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton(
      {super.key,
      this.color,
      this.onPressed,
      required this.textValue,
      this.widthRate = 0.85});
  final Color? color;
  final Function()? onPressed;
  final String textValue;
  final double widthRate;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
        width: size.width * widthRate,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(color),
            ),
            onPressed: onPressed,
            child: Text(
              textValue,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ));
  }
}
