import 'package:flutter/material.dart';

Widget buttonSection = Container(
  padding: const EdgeInsets.all(10),
  // decoration: BoxDecoration(
  //   color: Colors.blueGrey.withOpacity(0.5),
  // ),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      _buildButtonColumn(Colors.red, 'Call', Icons.call),
      _buildButtonColumn(Colors.green, 'Route', Icons.near_me),
      _buildButtonColumn(Colors.blue, 'Share', Icons.share),
    ],
  ),
);

Column _buildButtonColumn(Color color, String label, IconData icon) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(
        icon,
        color: color,
      ),
      Container(
        margin: const EdgeInsets.only(top: 8),
        child: Text(label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            )),
      )
    ],
  );
}
