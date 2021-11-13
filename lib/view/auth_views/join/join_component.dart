import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../colors.dart';
import '../../../../typography.dart';
import 'package:loading_indicator/loading_indicator.dart';

enum JoinPosition { nickname, phoneNumber, VerificationCode }

class JoinComponent extends StatefulWidget {
  final title;
  final subtitle;
  final hintText;
  final error;
  final bool showError;
  final bool isLoading;

  final show;
  final joinPosition;
  final Function(String) onNickname;
  final Function(String) onPhone;
  final Function(String) onVerification;
  final Function(bool) onError;
  final Function() onSuccess;
  final bool isVerificationFailed;

  JoinComponent(
      {Key? key,
      @required this.title,
      @required this.subtitle,
      @required this.error,
      @required this.hintText,
      @required this.show,
      this.joinPosition,
      required this.onNickname,
      required this.onPhone,
      required this.onVerification,
      required this.onError,
      required this.onSuccess,
      this.isVerificationFailed = false,
      this.showError = false,
      this.isLoading = false})
      : super(key: key);

  @override
  State<JoinComponent> createState() => _JoinComponentState();
}

class _JoinComponentState extends State<JoinComponent> {
  CountryCode cc = CountryCode.fromCountryCode("IT");

  bool isUserNameValid(String value) {
    if (value.length < 3) {
      return false;
    }
    return true;
  }

  bool isPhoneValid(String value) {
    String patttern = r'(^(?:[+0]9)?[0-9]{9,12}$)';
    RegExp regExp = new RegExp(patttern);
    if (!regExp.hasMatch(value)) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: !widget.show,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 300),
        opacity: widget.show ? 1 : 0,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.title,
                style: kBodyLarge.copyWith(color: Colors.white),
              ),
            ),
            Text(
              widget.subtitle,
              style: kBodySmall.copyWith(color: Colors.white70),
            ),
            SizedBox(
              width: 350,
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: widget.joinPosition == JoinPosition.nickname
                    ? TextField(
                        textAlign: TextAlign.center,
                        decoration: new InputDecoration(
                          hintText: widget.hintText,
                          hintStyle: kBodySmall.copyWith(color: Colors.white30),
                        ),
                        style: kBodySmall.copyWith(color: Colors.white),
                        onChanged: (newNickname) {
                          if (isUserNameValid(newNickname)) {
                            widget.onNickname(newNickname);
                            setState(() {
                              widget.onError(false);
                            });
                          } else {
                            setState(() {
                              widget.onError(true);
                            });
                          }
                        },
                      )
                    : widget.joinPosition == JoinPosition.phoneNumber
                        ? Row(
                            children: [
                              CountryCodePicker(
                                onChanged: (newCountryCode) {
                                  cc = newCountryCode;
                                },
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
                                  maxLength: 15,
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.number,
                                  decoration: new InputDecoration(
                                    hintText: widget.hintText,
                                    hintStyle: kBodySmall.copyWith(color: Colors.white30),
                                  ),
                                  style: kBodySmall.copyWith(color: Colors.white),
                                  onChanged: (newPhone) {
                                    if (isPhoneValid(newPhone)) {
                                      String code = cc.dialCode != null ? cc.dialCode! : "";
                                      print(code + newPhone);
                                      widget.onPhone(code + newPhone);

                                      setState(() {
                                        widget.onError(false);
                                      });
                                    } else {
                                      setState(() {
                                        widget.onError(true);
                                      });
                                    }
                                  },
                                ),
                              )
                            ],
                          )
                        : widget.joinPosition == JoinPosition.VerificationCode
                            ? PinCodeTextField(
                                appContext: context,
                                length: 6,
                                animationType: AnimationType.fade,
                                onChanged: (digits) => {},
                                textStyle: kBodySmall.copyWith(color: Colors.white),
                                onCompleted: (code) {
                                  widget.onVerification(code);
                                },
                              )
                            : SizedBox.shrink(),
              ),
            ),
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Opacity(
                  opacity: widget.showError ? 1 : 0,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      widget.error,
                      style: kBodySmall.copyWith(color: kError),
                    ),
                  ),
                ),
                Container(
                  width: 100,
                  height: 48,
                  child: Opacity(
                    opacity: widget.isLoading ? 1 : 0,
                    child: LoadingIndicator(
                      indicatorType: Indicator.ballRotate,
                      colors: [kAccentColor, kAccentColor.withOpacity(0.8), kAccentColor.withOpacity(0.6)],
                      strokeWidth: 3,
                      backgroundColor: Colors.transparent,
                      pathBackgroundColor: Colors.transparent,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
