import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:groupidy/constants.dart';
import 'package:groupidy/controller/user_controller.dart';
import 'package:groupidy/typography.dart';
import 'package:groupidy/view/components/button.dart';
import 'package:groupidy/view/auth_views/join/join_component.dart';

import '../../../colors.dart';

class JoinScreenMobile extends StatefulWidget {
  const JoinScreenMobile({Key? key}) : super(key: key);

  @override
  _JoinScreenMobileState createState() => _JoinScreenMobileState();
}

class _JoinScreenMobileState extends State<JoinScreenMobile> {
  UserController userController = Get.find();

  String nickname = "";
  String phone = "";
  String verification = "";
  bool isError = false;
  bool isLoading = false;
  bool isStart = true;

  var pos = JoinPosition.nickname;

  void _conitnue() {
    if (pos == JoinPosition.nickname) {
      setState(() {
        isStart = true;
        pos = JoinPosition.phoneNumber;
      });
    } else if (pos == JoinPosition.phoneNumber) {
      setState(() {
        isError = false;
        isLoading = true;
      });

      userController.registerPhone(
          phoneNumber: phone,
          nickname: nickname,
          verificationFailed: () {
            setState(() {
              isError = true;
              isLoading = false;
            });
          });

      setState(() {
        isLoading = false;
        isError = false;
        isStart = true;
        pos = JoinPosition.VerificationCode;
      });
    } else if (pos == JoinPosition.VerificationCode) {}
  }

  void nicknameSubmit(String newNickname) {
    setState(() {
      isStart = false;
    });
    nickname = newNickname;
  }

  void phoneSubmit(String newPhone) {
    setState(() {
      isStart = false;
    });
    phone = newPhone;
  }

  void onError(bool newError) {
    setState(() {
      isError = newError;
    });
  }

  void onSuccess() {
    setState(() {
      isError = false;
      isLoading = false;
    });
  }

  void verificationSubmit(String newVerification) {
    setState(() {
      isError = false;
      isLoading = true;
    });
    verification = newVerification;
    userController.registerPhone(
        phoneNumber: phone,
        nickname: nickname,
        smsCode: newVerification,
        verificationFailed: () {
          setState(() {
            isError = true;
            isLoading = false;
          });
        });
    // TODO Submit verification
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kPrimaryBackground,
        title: Text(
          "Welcome to Groupidy!",
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
                        title: "How do you call yourself?",
                        subtitle: "You won't be able to change it later",
                        error: "* Nickname must contain atleast 3 characters",
                        hintText: "Example: nickname123",
                        show: pos == JoinPosition.nickname,
                        joinPosition: JoinPosition.nickname,
                        onNickname: nicknameSubmit,
                        onPhone: (str) {},
                        onVerification: (str) {},
                        onError: onError,
                        showError: isError,
                        onSuccess: onSuccess,
                      ),
                      JoinComponent(
                        title: "Hello $nickname,",
                        subtitle: "Please enter your phone number",
                        error: "* Please enter a valid phone number",
                        hintText: "123 123 123",
                        show: pos == JoinPosition.phoneNumber,
                        joinPosition: JoinPosition.phoneNumber,
                        onNickname: (str) {},
                        onPhone: phoneSubmit,
                        onVerification: (str) {},
                        isLoading: isLoading,
                        onError: onError,
                        showError: isError,
                        onSuccess: onSuccess,
                      ),
                      JoinComponent(
                        title: "Enter verification code",
                        subtitle: "We have sent you a code",
                        error: "* Wrong verification code",
                        hintText: "Example: 123456",
                        show: pos == JoinPosition.VerificationCode,
                        joinPosition: JoinPosition.VerificationCode,
                        showError: isError,
                        onNickname: (str) {},
                        onPhone: (str) {},
                        onVerification: verificationSubmit,
                        isLoading: isLoading,
                        onError: onError,
                        onSuccess: onSuccess,
                      ),
                    ],
                  ),
                  Spacer(),
                  Opacity(
                    opacity: !isButtonValid() || isStart
                        ? 0.5
                        : pos == JoinPosition.VerificationCode
                            ? 0
                            : 1,
                    child: Button(
                      onPressed: isButtonValid() ? _conitnue : null,
                      text: "Continue",
                      width: 300,
                    ),
                  ),
                  Spacer()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool isButtonValid() {
    if (isError || isLoading || isStart) {
      return false;
    }

    return true;
  }
}
