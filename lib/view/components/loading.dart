import 'package:flutter/material.dart';
import 'package:groupidy/colors.dart';
import 'package:loading_indicator/loading_indicator.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key, required this.isLoading}) : super(key: key);

  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
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
    );
  }
}
