import 'package:flutter/material.dart';
import 'package:groupidy/responsive/device_screen_type.dart';
import 'package:groupidy/responsive/responsive_builder.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({
    Key? key,
    required this.mobile,
    this.tablet,
    this.desktop,
  }) : super(key: key);

  final Widget mobile;
  final Widget? tablet;
  final Widget? desktop;

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        if (sizingInformation.deviceScreenType == DeviceScreenType.Desktop &&
            desktop != null) {
          return desktop ?? SizedBox();
        } else if (sizingInformation.deviceScreenType ==
                DeviceScreenType.Tablet &&
            tablet != null) {
          return tablet ?? SizedBox();
        } else {
          return mobile;
        }
      },
    );
  }
}
