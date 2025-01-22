import 'package:flutter/material.dart';

class FollowButton extends StatelessWidget {
  const FollowButton(
      {super.key,
      this.function,
      required this.backgroundColor,
      required this.borderColor,
      required this.text,
      required this.textColor,
    });
  final Color backgroundColor;
  final Color borderColor;
  final String text;
  final Color textColor;
  final Function()? function;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20),
      
      child: TextButton(
        onPressed: function,
        child: Container(
          width: 170,
          height: 35,
          decoration: BoxDecoration(
            color: backgroundColor,
            border: Border.all(
              color: borderColor,
            ),
            borderRadius: BorderRadius.circular(7),
          ),
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(
              fontSize: 15,
              color: textColor,
              fontWeight: FontWeight.w400
            ),
          ),
        ),
      ),
    );
  }
}
