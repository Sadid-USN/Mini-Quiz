import 'package:flutter/material.dart';

class FlashCardView extends StatelessWidget {
  const FlashCardView({Key? key, this.text}) : super(key: key);
  final String ? text;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 6,
      child: Center(
        child: Text(
          text!,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
