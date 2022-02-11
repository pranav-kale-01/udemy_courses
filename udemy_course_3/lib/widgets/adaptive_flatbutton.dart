import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AdaptiveFlatButton {
  static get adaptiveFlatButton =>
      ({required Widget child, Function? onPressed}) => Platform.isIOS
          ? CupertinoButton(
              child: child,
              onPressed: onPressed as VoidCallback,
            )
          : OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: const BorderSide(
                  color: Colors.black26,
                ),
              ),
              onPressed: onPressed as VoidCallback,
              child: child,
            );
}
