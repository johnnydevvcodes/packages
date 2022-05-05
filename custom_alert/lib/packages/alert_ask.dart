import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'custom_dialog.dart';
import 'custom_dialog_button.dart';

class AlertAsk {
  final BuildContext context;
  final String title;
  final String subTitle;
  final String? yesText;
  final String? noText;
  final Color? color;
  final Function? onYes;

  final Widget? yesButton;
  final Widget? noButton;

  AlertAsk(
    this.context, {
    this.color,
    this.yesButton,
    this.noButton,
    required this.title,
    required this.subTitle,
    this.yesText,
    this.onYes,
    this.noText,
  });

  show() {
    return CustomDialogAlert(
      context,
      title: title,
      buttonPadding: const EdgeInsets.symmetric(vertical: 12),
      customBody: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(14)),
        ),
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 12),
        height: 120,
        width: 180,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: AutoSizeText(
                  subTitle,
                  minFontSize: 8,
                  style: const TextStyle(fontSize: 16, color: Colors.black),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
      yesButton: yesButton != null
          ? CustomDialogButton(child: yesButton)
          : CustomDialogButton(
              onTap: () {
                onYes?.call();
              },
              text: noText,
              color: color,
            ),
      noButton: noButton != null
          ? CustomDialogButton(child: noButton)
          : CustomDialogButton(
              onTap: () {
                Navigator.pop(context);
              },
              text: noText,
              color: Colors.black54,
            ),
    ).show();
  }
}
