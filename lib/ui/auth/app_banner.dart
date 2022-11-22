import 'dart:math';

import 'package:flutter/material.dart';

class AppBanner extends StatelessWidget {
  const AppBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 35),
      padding: const EdgeInsets.symmetric(
        vertical: 25.0,
        horizontal: 44.0,
      ),
      // transform: Matrix4.rotationZ(-8 * pi / 180)..translate(-10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.white60,
        boxShadow: const [
          BoxShadow(
            blurRadius: 10,
            color: Colors.yellowAccent,
            offset: Offset(0, 3),
          )
        ],
      ),
      child: Text(
        'Food And Drink',
        style: TextStyle(
          color: Theme.of(context).textTheme.headline6?.color,
          fontSize: 45,
          fontFamily: 'Anton',
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }
}
