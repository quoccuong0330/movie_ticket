import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Func {
  static void navigateToNextScreen(BuildContext context, Widget widget) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) => widget));
  }

  static void navigateToPrevScreen(BuildContext context) {
    Navigator.pop(context);
  }

  static Widget backBtn(context) {
    return GestureDetector(
      onTap: () {
        Func.navigateToPrevScreen(context);
      },
      child: const Icon(
        Icons.arrow_back_rounded,
        size: 28,
      ),
    );
  }
}
