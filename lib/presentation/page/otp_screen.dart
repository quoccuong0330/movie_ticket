import 'package:flutter/material.dart';
import 'package:movie_ticket/presentation/page/sign_up_screen.dart';
import 'package:movie_ticket/util/function.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Func.backBtn(context),
              ],
            )
          ],
        ),
      ),
    );
  }
}
