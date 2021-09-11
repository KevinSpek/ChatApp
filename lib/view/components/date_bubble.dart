import 'package:flutter/material.dart';
import 'package:groupidy/colors.dart';
import 'package:groupidy/typography.dart';

String getFormattedDate(DateTime dateTime) {
  Duration duration = DateTime.now().difference(dateTime);
  if (duration.inDays < 1)
    return "Today";
  return "${dateTime.day.toString().padLeft(2,'0')}/${dateTime.month.toString().padLeft(2,'0')}/${dateTime.year.toString()}";
}

class DateBubble extends StatelessWidget {
  const DateBubble({ Key? key, required this.dateTime}) : super(key: key);

  final DateTime dateTime;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kDisabledBubble,
        borderRadius: BorderRadius.circular(8)
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        child: Text(getFormattedDate(dateTime), style: kCaption.copyWith(color: kWhiteDisabled),),
      ),
    );
  }
}
