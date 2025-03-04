import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final String text;
  Color? color;
  final VoidCallback onClick;

  CalculatorButton({
    super.key,
    required this.text,
    this.color,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
            onPressed: onClick,
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(24),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              backgroundColor: color ?? Colors.grey[850],
            ),
            child: Text(
              text,
              style: TextStyle(fontSize: 20, color: Colors.white),
            )),
      ),
    );
  }
}
