import 'package:flutter/material.dart';
import 'package:groupidy/colors.dart';
import 'package:groupidy/typography.dart';
import 'package:groupidy/view/components/create_join_group/bottom_buttons.dart';

class CreateGroup extends StatelessWidget {
  const CreateGroup({Key? key, required this.onCancel, required this.onTextChanged, required this.onMainButtonClick}) : super(key: key);

  final VoidCallback onCancel;
  final VoidCallback onMainButtonClick;
  final Function(String) onTextChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Group name",
            style: kBodyRegular.copyWith(color: kWhite),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              maxLength: 40,
              textAlign: TextAlign.start,
              onChanged: onTextChanged,
              decoration: InputDecoration(
                hintText: "Example: groupidy#aB12",
                counterText: "",
                hintStyle: kBodyRegular.copyWith(color: kWhiteDisabled),
              ),
              style: kBodyRegular.copyWith(color: Colors.white),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Text(
              "Group image",
              style: kBodyRegular.copyWith(color: kWhite),
            ),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
              child: ElevatedButton(
                onPressed: () {},
                child: Icon(
                  Icons.add, 
                  size: 32,
                  color: kSecondaryBackground),
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  primary: kWhiteSecondary,
                  fixedSize: Size(80 , 80),
                ),
              )),
          BottomButtons(
              mainButtonText: "Create",
              onMainButtonClick: onMainButtonClick,
              onCancelClick: onCancel)
        ],
      ),
    );
  }
}
