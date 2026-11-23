import 'package:flutter/material.dart';

class ResultCardComponent extends StatelessWidget {
  const ResultCardComponent({
    super.key,
    required this.title,
    required this.info,
  });

  final String title;
  final String info;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
          ),
          Text(info, style: TextStyle(fontSize: 18)),
        ],
      ),
    );
  }
}
