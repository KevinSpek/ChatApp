import 'package:flutter/material.dart';
import 'package:groupidy/constants.dart';
import 'package:groupidy/typography.dart';

import '../../colors.dart';

class JoinScreen extends StatelessWidget {
  const JoinScreen({Key? key}) : super(key: key);

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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "How do you call yourself?",
                      style: kBodyLarge.copyWith(color: Colors.white),
                    ),
                  ),
                  Text(
                    "You won't be able to change it later",
                    style: kBodySmall.copyWith(color: Colors.white70),
                  ),
                  SizedBox(
                    width: 300,
                    child: Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: TextField(
                          textAlign: TextAlign.center,
                          decoration: new InputDecoration(
                            hintText: "Example: nickname123",
                            hintStyle: kBodySmall.copyWith(color: Colors.white30),
                          ),
                          style: kBodySmall.copyWith(color: Colors.white)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      "* Nickname must contain atleast 3 characters",
                      style: kBodySmall.copyWith(color: kError),
                    ),
                  ),
                  Spacer(),
                  Container(
                    width: 300,
                    height: 48,
                    child: TextButton(
                      onPressed: () {},
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
