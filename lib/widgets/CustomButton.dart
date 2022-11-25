import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final IconData iconData;
  final VoidCallback onPress;

  CustomButton(
      {required this.text, required this.iconData, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPress,
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(double.maxFinite, 50),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(iconData),
            const SizedBox(
              width: 10.0,
            ),
            Text(
              text,
              style: const TextStyle(fontSize: 18),
            )
          ],
        ));
  }
}
