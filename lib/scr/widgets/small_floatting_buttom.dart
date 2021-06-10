import 'package:app_food/scr/commons.dart';
import 'package:flutter/material.dart';

class SmallButton extends StatelessWidget {
  final IconData icon;
  const SmallButton({Key key, @required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        decoration: BoxDecoration(
          color: red,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Icon(
            icon,
            size: 16,
            color: white,
          ),
        ),
      ),
    );
  }
}
