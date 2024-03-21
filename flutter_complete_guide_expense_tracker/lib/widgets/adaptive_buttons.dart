import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveTextButton extends StatelessWidget {
  final String _text;
  final _handler;

  AdaptiveTextButton(this._text, this._handler) {}

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            child: Text(
              _text,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: _handler,
          )
        : TextButton(
            onPressed: _handler,
            child: Text(
              _text,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          );
  }
}
