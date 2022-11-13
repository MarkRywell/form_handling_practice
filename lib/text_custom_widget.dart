import 'package:flutter/material.dart';

class TextCustom extends StatelessWidget {

  final text_title;
  final text_data;

  const TextCustom({
    required this.text_title, required this.text_data,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Row(
        children: [
          SizedBox(
              width: 80,
            child: Text(text_title),
          ),
          const VerticalDivider(width: 50),
          SizedBox(
            width: 200,
            child: Text(': $text_data'),
          )
        ],
      )
    );
  }
}
