import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../colors.dart';
import '../../typography.dart';

enum JoinPosition { nickname, phoneNumber, VerificationCode }

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
