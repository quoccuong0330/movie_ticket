import 'package:flutter/material.dart';
import 'package:movie_ticket/util/function.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
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
