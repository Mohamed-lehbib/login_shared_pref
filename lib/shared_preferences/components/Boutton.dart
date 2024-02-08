import 'dart:html';

import 'package:flutter/material.dart';

Widget ButtonComponent(
    {required String label, required FunctionStringCallback onTap}) {
  return Container(
    height: 40,
    width: 40,
    child: Text(label),
    alignment: Alignment.center,
  );
}
