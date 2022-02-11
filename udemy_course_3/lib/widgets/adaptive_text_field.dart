import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class AdaptiveTextField {
  static Widget getAdaptiveTextField(
      {TextEditingController? textController,
      required String title,
      TextInputType? keyboardType}) {
    return Platform.isIOS
        ? CupertinoTextField(
            controller: textController,
            placeholder: title,
            keyboardType: keyboardType,
          )
        : TextField(
            controller: textController,
            decoration: InputDecoration(
              labelText: title,
            ),
            keyboardType: keyboardType,
          );
  }
}
