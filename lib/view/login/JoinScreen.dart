import 'package:flutter/material.dart';
import 'package:groupidy/constants.dart';
import 'package:groupidy/typography.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../colors.dart';

enum JoinPosition { nickname, phoneNumber, VerificationCode }

class JoinScreen extends StatefulWidget {
  const JoinScreen({Key? key}) : super(key: key);

  @override
  _JoinScreenState createState() => _JoinScreenState();
}

class _JoinScreenState extends State<JoinScreen> {
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
                        show: pos == JoinPosition.nickname,
                        joinPosition: pos,
                      ),
                      JoinComponent(
                        title: "Hello nickname,",
                        subtitle: "Please enter your phone number",
                        error: "* Please enter a valid phone number",
                        hintText: "123 123 123",
                        show: pos == JoinPosition.phoneNumber,
                        joinPosition: pos,
                      ),
                      JoinComponent(
                        title: "Enter verification code",
                        subtitle: "We have sent you a code",
                        error: "* Wrong verification code",
                        hintText: "Example: 123456",
                        show: pos == JoinPosition.VerificationCode,
                        joinPosition: pos,
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
  final joinPosition;

  const JoinComponent({Key? key, @required this.title, @required this.subtitle, @required this.error, @required this.hintText, @required this.show, this.joinPosition}) : super(key: key);

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
              width: 350,
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: joinPosition == JoinPosition.nickname
                    ? TextField(
                        textAlign: TextAlign.center,
                        decoration: new InputDecoration(
                          hintText: hintText,
                          hintStyle: kBodySmall.copyWith(color: Colors.white30),
                        ),
                        style: kBodySmall.copyWith(color: Colors.white),
                      )
                    : joinPosition == JoinPosition.phoneNumber
                        ? Row(
                            children: [
                              CountryCodePicker(
                                onChanged: print,
                                // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                                initialSelection: 'IT',
                                favorite: ['+39', 'FR'],
                                // optional. Shows only country name and flag
                                showCountryOnly: false,
                                // optional. Shows only country name and flag when popup is closed.
                                showOnlyCountryWhenClosed: false,
                                // optional. aligns the flag and the Text left
                                alignLeft: false,
                                textStyle: kBodySmall.copyWith(color: Colors.white),
                              ),
                              SizedBox(
                                width: 150,
                                child: TextField(
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.number,
                                  decoration: new InputDecoration(
                                    hintText: hintText,
                                    hintStyle: kBodySmall.copyWith(color: Colors.white30),
                                  ),
                                  style: kBodySmall.copyWith(color: Colors.white),
                                ),
                              )
                            ],
                          )
                        : joinPosition == JoinPosition.VerificationCode
                            ? PinCodeTextField(
                                appContext: context,
                                length: 6,
                                animationType: AnimationType.fade,
                                onChanged: (digits) => {},
                                textStyle: kBodySmall.copyWith(color: Colors.white),
                              )
                            : SizedBox.shrink(),
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
