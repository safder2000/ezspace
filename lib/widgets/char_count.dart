import 'package:flutter/material.dart';

class CharCount extends StatelessWidget {
  const CharCount({
    Key? key,
    required this.charLength,
  }) : super(key: key);

  final int charLength;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            "$charLength/200",
            style: TextStyle(fontSize: 15, color: Colors.black26),
          ),
        ),
      ],
    );
  }
}
