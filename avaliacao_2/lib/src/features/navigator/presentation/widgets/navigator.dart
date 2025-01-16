import 'package:flutter/material.dart';

void nav(context, screen) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return screen;
    }));
}
