import 'package:flutter/material.dart';
import 'package:groupidy/view/components/button.dart';
import 'package:groupidy/view/components/joinComponent.dart';

import '../../colors.dart';
import '../../constants.dart';
import '../../typography.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var pos = JoinPosition.phoneNumber;

  void _conitnue() {
    if (pos == JoinPosition.phoneNumber) {
      setState(() {
        pos = JoinPosition.VerificationCode;
      });
    } else if (pos == JoinPosition.VerificationCode) {
      // login user....
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kPrimaryBackground,
        title: Text(
          "Welcome Back",
          style: kSubTitle.copyWith(color: Colors.white),
        ),
      ),
      body: Stack(
        children: [
          Container(color: kPrimaryBackground),
          Container(
            width: width,
            child: Padding(
              padding: const EdgeInsets.all(kPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Spacer(),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      JoinComponent(
                        title: "Please enter your phone number.",
                        subtitle: "",
                        error: "* Please enter a valid phone number",
                        hintText: "123 123 123",
                        show: pos == JoinPosition.phoneNumber,
                        joinPosition: JoinPosition.phoneNumber,
                      ),
                      JoinComponent(
                        title: "Enter verification code",
                        subtitle: "We have sent you a code",
                        error: "* Wrong verification code",
                        hintText: "Example: 123456",
                        show: pos == JoinPosition.VerificationCode,
                        joinPosition: JoinPosition.VerificationCode,
                      ),
                    ],
                  ),
                  Spacer(),
                  Button(
                    onPressed: _conitnue,
                    text: "Continue",
                    width: 300,
                  ),
                  Spacer()
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
