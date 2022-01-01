import 'package:flutter/material.dart';
import '../../../../colors.dart';
import '../../../../typography.dart';

class LoginComponent extends StatelessWidget {
  final Widget child;
  final String title;
  final String subtitle;
  final String errorMsg;
  final bool showError;

  LoginComponent({
    Key? key,
    required this.child,
    required this.title,
    required this.subtitle,
    required this.errorMsg,
    this.showError = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
            child: child,
          ),
        ),
        Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Opacity(
              opacity: showError ? 1 : 0,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  errorMsg,
                  style: kBodySmall.copyWith(color: kError),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
