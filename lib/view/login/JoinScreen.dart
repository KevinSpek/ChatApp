import 'package:flutter/material.dart';
import 'package:groupidy/constants.dart';
import 'package:groupidy/typography.dart';

import '../../colors.dart';

enum joinPosition { nickname, phoneNumber, VerificationCode }

class JoinScreen extends StatefulWidget {
  const JoinScreen({Key? key}) : super(key: key);

  @override
  _JoinScreenState createState() => _JoinScreenState();
}

class _JoinScreenState extends State<JoinScreen> {
  var pos = joinPosition.nickname;

  void _conitnue() {
    if (pos == joinPosition.nickname) {
      setState(() {
        pos = joinPosition.phoneNumber;
      });
    } else if (pos == joinPosition.phoneNumber) {
      setState(() {
        pos = joinPosition.VerificationCode;
      });
    } else if (pos == joinPosition.VerificationCode) {
      // register user....
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryBackground,
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
                  Text(
                    "Welcome to Groupidy!",
                    style: kSubTitle.copyWith(color: Colors.white),
                  ),
                  Spacer(),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      JoinComponent(
                        title: "How do you call yourself?",
                        subtitle: "You won't be able to change it later",
                        error: "* Nickname must contain atleast 3 characters",
                        hintText: "Example: nickname123",
                        show: pos == joinPosition.nickname,
                      ),
                      JoinComponent(
                        title: "Hello nickname,",
                        subtitle: "Please enter your phone number",
                        error: "* Please enter a valid phone number",
                        hintText: "Example: +1 123 123 123",
                        show: pos == joinPosition.phoneNumber,
                      ),
                      JoinComponent(
                        title: "Enter verification code",
                        subtitle: "We have send you a code",
                        error: "* Wrong verification code",
                        hintText: "Example: 123456",
                        show: pos == joinPosition.VerificationCode,
                      ),
                    ],
                  ),
                  Spacer(),
                  Container(
                    width: 300,
                    height: 48,
                    child: TextButton(
                      onPressed: _conitnue,
                      child: Text("Continue", style: kBodyLarge.copyWith(color: Colors.white)),
                      style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(kAccentColor)),
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
}

class JoinComponent extends StatelessWidget {
  final title;
  final subtitle;
  final hintText;
  final error;
  final show;

  const JoinComponent({Key? key, @required this.title, @required this.subtitle, @required this.error, @required this.hintText, @required this.show}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: !show,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 300),
        opacity: show ? 1 : 0,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: kBodyLarge.copyWith(color: Colors.white),
              ),
            ),
            Text(
              subtitle,
              style: kBodySmall.copyWith(color: Colors.white70),
            ),
            SizedBox(
              width: 300,
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: TextField(
                    textAlign: TextAlign.center,
                    decoration: new InputDecoration(
                      hintText: hintText,
                      hintStyle: kBodySmall.copyWith(color: Colors.white30),
                    ),
                    style: kBodySmall.copyWith(color: Colors.white)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                error,
                style: kBodySmall.copyWith(color: kError),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
