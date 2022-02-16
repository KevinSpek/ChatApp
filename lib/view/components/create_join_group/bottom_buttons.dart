import 'package:flutter/material.dart';
import 'package:chatapp/view/components/button.dart';

class BottomButtons extends StatelessWidget {
  const BottomButtons({Key? key, required this.mainButtonText, required this.onMainButtonClick, required this.onCancelClick}) : super(key: key);

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
              child: Button(
            onPressed: onMainButtonClick,
            text: mainButtonText,
            standout: true,
          )),
          SizedBox(width: 10),
          Expanded(
            child: Button(
              onPressed: () => Navigator.pop(context),
              text: "Cancel",
              showBackground: false,
            ),
          )
        ],
      ),
    );
  }
}
