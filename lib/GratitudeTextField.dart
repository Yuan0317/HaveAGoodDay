import 'package:flutter/material.dart';

class GratitudeTextField extends StatelessWidget {
  final TextEditingController controller;
  final int index;

  GratitudeTextField({required this.controller, required this.index});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: '事件 $index',
        border: OutlineInputBorder(),
      ),
      maxLines: null,
      keyboardType: TextInputType.multiline,
    );
  }
}
