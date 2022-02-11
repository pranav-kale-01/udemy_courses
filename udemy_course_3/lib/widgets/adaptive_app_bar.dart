import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'dart:io';

class AdaptiveAppBar {
  static PreferredSizeWidget getAdaptiveAppBar(context, methodToCall) {
    return Platform.isIOS
        ? CupertinoNavigationBar(
            middle: const Text("Personal Expenses"),
            trailing: GestureDetector(
              onTap: () => methodToCall(),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const <Widget>[
                  Icon(CupertinoIcons.add),
                ],
              ),
            ),
          )
        : AppBar(
            title: const Text('Personal Expenses'),
            actions: [
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 4,
                ),
                child: IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () => methodToCall(),
                ),
              )
            ],
          ) as PreferredSizeWidget;
  }
}
