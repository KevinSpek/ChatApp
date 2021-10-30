import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:groupidy/controller/user_controller.dart';
import 'package:groupidy/utils.dart';
import 'package:groupidy/view/auth_views/login/login_component.dart';
import 'package:groupidy/view/components/button.dart';
import 'package:groupidy/view/auth_views/join/join_component.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../colors.dart';
import '../../../constants.dart';
import '../../../typography.dart';

class LoginScreenMobile extends StatefulWidget {
  const LoginScreenMobile({Key? key}) : super(key: key);

  @override
  _LoginScreenMobileState createState() => _LoginScreenMobileState();
}

class _LoginScreenMobileState extends State<LoginScreenMobile> {
  UserController userController = Get.find();
  final PageController _pageController = PageController(initialPage: 0);
  final TextEditingController _textEditingController = TextEditingController();
  int pageIndex = 0;

  String phone = "";
  String verification = "";
  bool isError = false;
  bool isLoading = false;
  bool isStart = true;
  bool isCode = false;

  CountryCode cc = CountryCode.fromCountryCode("US");

  void _conitnue(BuildContext context) {
    setState(() {
      isError = false;
      isLoading = true;
    });

    userController.registerPhone(
        phoneNumber: phone,
        smsVerificationFailed: () {},
        reCAPTCHAFailed: () {
          showToast(context, "reCAPTCHA Failed");
          setState(() {
            isLoading = false;
          });
        },
        reCAPTCHASuccess: () {
          print("reCAPTCHA Success");
          setState(() {
            isLoading = false;
            isError = false;
            isStart = true;
            isCode = true;
          });
          _pageController.animateToPage(1, duration: Duration(seconds: 1), curve: Curves.easeInOut);
        });
  }

  void phoneSubmit(String newPhone) {
    phone = newPhone;
  }

  void verificationSubmit(String verificationCode) {
    setState(() {
      isError = false;
      isLoading = true;
    });
    print(verificationCode);
    userController.registerPhone(
      phoneNumber: phone,
      smsCode: verificationCode,
      smsVerificationFailed: () {
        _textEditingController.clear();
        setState(() {
          isError = true;
          isLoading = false;
        });
      },
    );
  }

  void onError(bool newError) {
    setState(() {
      isError = newError;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kSecondaryBackground,
        title: Text(
          "Enter App",
          style: kSubTitle.copyWith(color: Colors.white),
        ),
      ),
      body: Stack(
        children: [
          Container(color: kSecondaryBackground),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(kPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: PageView(
                      controller: _pageController,
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        LoginComponent(
                          child: Row(
                            children: [
                              CountryCodePicker(
                                onChanged: (newCountryCode) {
                                  cc = newCountryCode;
                                },
                                initialSelection: 'US',
                                favorite: ['US', '+972'],
                                showCountryOnly: false,
                                showOnlyCountryWhenClosed: false,
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
                                    hintText: "",
                                    hintStyle: kBodyRegular.copyWith(color: Colors.white30),
                                  ),
                                  style: kBodyRegular.copyWith(color: Colors.white),
                                  onChanged: (newPhone) {
                                    if (isStart) {
                                      setState(() {
                                        isStart = !isStart;
                                      });
                                    }

                                    if (isPhoneValid(newPhone)) {
                                      String code = cc.dialCode != null ? cc.dialCode! : "";
                                      print(code + newPhone);
                                      phoneSubmit(code + newPhone);
                                      onError(false);
                                    } else {
                                      onError(true);
                                    }
                                  },
                                ),
                              )
                            ],
                          ),
                          title: "Please Enter Your Phone Number",
                          subtitle: "",
                          errorMsg: "* Please enter a valid phone number",
                          showError: isError,
                        ),
                        LoginComponent(
                          child: PinCodeTextField(
                            appContext: context,
                            controller: _textEditingController,
                            length: 6,
                            animationType: AnimationType.fade,
                            onChanged: (digits) => {
                              if (isError) {isError = false}
                            },
                            textStyle: kBodySmall.copyWith(color: Colors.white),
                            onCompleted: (digits) {
                              verificationSubmit(digits);
                            },
                          ),
                          title: "Enter verification code",
                          subtitle: "We have sent you a code",
                          errorMsg: "* Wrong verification code",
                          showError: isError,
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Opacity(
                    opacity: isCode
                        ? 0
                        : !isButtonValid() || isStart
                            ? 0.5
                            : 1,
                    child: Button(
                      onPressed: isButtonValid()
                          ? () {
                              _conitnue(context);
                            }
                          : null,
                      text: "Continue",
                      width: 300,
                    ),
                  ),
                  Spacer()
                ],
              ),
            ),
          ),
          IgnorePointer(
            ignoring: isLoading ? false : true,
            child: Opacity(
              opacity: isLoading ? 1 : 0,
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Container(color: Colors.black.withOpacity(0.3)),
                  Container(
                    width: 100,
                    height: 48,
                    child: LoadingIndicator(
                      indicatorType: Indicator.ballRotate,
                      colors: [kAccentColor, kAccentColor.withOpacity(0.8), kAccentColor.withOpacity(0.6)],
                      strokeWidth: 3,
                      backgroundColor: Colors.transparent,
                      pathBackgroundColor: Colors.transparent,
                    ),
                  )
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
