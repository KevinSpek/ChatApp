import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:groupidy/view/components/button.dart';
import 'package:groupidy/view/auth_views/join/join_component.dart';

import '../../../colors.dart';
import '../../../constants.dart';
import '../../../typography.dart';

class LoginScreenMobile extends StatefulWidget {
  const LoginScreenMobile({Key? key}) : super(key: key);

  @override
  _LoginScreenMobileState createState() => _LoginScreenMobileState();
}

class _LoginScreenMobileState extends State<LoginScreenMobile> {
  var pos = JoinPosition.phoneNumber;

  String phone = "";
  String verification = "";
  bool isError = false;
  bool isLoading = false;

  void _conitnue() {
    if (pos == JoinPosition.phoneNumber) {
      setState(() {
        pos = JoinPosition.VerificationCode;
      });
    } else if (pos == JoinPosition.VerificationCode) {
      // login user....
      Get..toNamed('/home');
    }
  }

  void phoneSubmit(String newPhone) {
    phone = newPhone;
  }

  void verificationSubmit(String newVerification) {
    verification = newVerification;
  }

  void onError(bool newError) {
    isError = newError;
  }

  void onSuccess() {
    setState(() {
      isError = false;
      isLoading = false;
    });
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
                        onNickname: (str) {},
                        onPhone: phoneSubmit,
                        onVerification: (str) {},
                        onError: onError,
                        onSuccess: onSuccess,
                      ),
                      JoinComponent(
                        title: "Enter verification code",
                        subtitle: "We have sent you a code",
                        error: "* Wrong verification code",
                        hintText: "Example: 123456",
                        show: pos == JoinPosition.VerificationCode,
                        joinPosition: JoinPosition.VerificationCode,
                        onNickname: (str) {},
                        onPhone: (str) {},
                        onVerification: verificationSubmit,
                        onError: onError,
                        onSuccess: onSuccess,
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
