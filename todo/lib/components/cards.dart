import 'package:flutter/material.dart';

import '../color.dart';

class dashboardCard extends StatelessWidget {
  final number;
  final text;
  const dashboardCard({
    Key? key,
    required this.number,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Text(
            number,
            style: const TextStyle(
                color: primarycolor, fontSize: 22, fontWeight: FontWeight.w900),
          ),
          Text(
            text,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w900),
          ),
        ],
      ),
    );
  }
}
