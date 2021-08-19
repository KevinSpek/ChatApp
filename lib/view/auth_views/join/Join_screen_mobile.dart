import 'package:flutter/material.dart';
import 'package:groupidy/constants.dart';
import 'package:groupidy/typography.dart';
import 'package:groupidy/view/auth_views/components/button.dart';
import 'package:groupidy/view/auth_views/components/join_component.dart';



import '../../../colors.dart';

class JoinScreenMobile extends StatefulWidget {
  const JoinScreenMobile({Key? key}) : super(key: key);

  @override
  _JoinScreenMobileState createState() => _JoinScreenMobileState();
}

class _JoinScreenMobileState extends State<JoinScreenMobile> {
  var pos = JoinPosition.nickname;

  void _conitnue() {
    if (pos == JoinPosition.nickname) {
      setState(() {
        pos = JoinPosition.phoneNumber;
      });
    } else if (pos == JoinPosition.phoneNumber) {
      setState(() {
        pos = JoinPosition.VerificationCode;
      });
    } else if (pos == JoinPosition.VerificationCode) {
      // register user....
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
                      ),
                      JoinComponent(
                        title: "Hello nickname,",
                        subtitle: "Please enter your phone number",
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
          ),
        ],
      ),
    );
  }
}
