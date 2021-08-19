import 'package:flutter/material.dart';
import 'package:groupidy/responsive/sizing_information.dart';
import 'package:groupidy/utils.dart';

class ResponsiveBuilder extends StatelessWidget {
  const ResponsiveBuilder({Key? key, required this.builder}) : super(key: key);
  final Widget Function(BuildContext context, SizingInformation sizingInformation) builder;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, boxConstraints) {
      var mediaQuery = MediaQuery.of(context);
      var sizingInformation = SizingInformation(
        orientation: mediaQuery.orientation,
        deviceScreenType: getDeviceType(mediaQuery),
        screenSize: mediaQuery.size,
        localWidgetSize: Size(boxConstraints.maxWidth, boxConstraints.maxHeight),
      );

      return builder(context, sizingInformation);
    });
  }
}
