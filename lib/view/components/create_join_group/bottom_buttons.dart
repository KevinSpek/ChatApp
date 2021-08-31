import 'package:flutter/material.dart';
import 'package:groupidy/colors.dart';
import 'package:groupidy/typography.dart';

class BottomButtons extends StatelessWidget {
  const BottomButtons({
    Key? key, 
    required this.mainButtonText,
    required this.onMainButtonClick,
    required this.onCancelClick})
      : super(key: key);

  final String mainButtonText;
  final VoidCallback onMainButtonClick;
  final VoidCallback onCancelClick;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [
          Expanded(
              child: ElevatedButton(
                  onPressed: onMainButtonClick,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      mainButtonText,
                      style: kBodyLarge,
                    ),
                  ))),
          Expanded(
              child: TextButton(
                  onPressed: onCancelClick,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      "Cancel",
                      style: kBodyLarge.copyWith(color: kWhite),
                    ),
                  )))
        ],
      ),
    );
  }
}