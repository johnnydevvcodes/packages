import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'custom_dialog.dart';
import 'custom_dialog_button.dart';

class AlertTitleAndMessage {
  final BuildContext context;
  final String title;
  final String subTitle;
  final Color? color;

  AlertTitleAndMessage(
    this.context, {
    this.color,
    required this.title,
    required this.subTitle,
  });

  show() {
    return CustomDialogAlert(
      context,
      title: title,
      customBody: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(14)),
        ),
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 12),
        height: 120,
        width: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: AutoSizeText(
                  subTitle,
                  minFontSize: 8,
                  style: const TextStyle(fontSize: 16, color: Colors.black54),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
      yesButton: CustomDialogButton(
        onTap: () async {
          Navigator.pop(context);
        },
        text: "Dismiss",
        color: color,
      ),
    ).show();
  }
}
