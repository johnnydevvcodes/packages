import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'custom_dialog_button.dart';

class CustomDialogAlert {
  final BuildContext context;
  final Widget customBody;
  final String? title;
  final CustomDialogButton? yesButton;
  final CustomDialogButton? noButton;

  final EdgeInsets? buttonPadding;

  final BorderRadius? borderRadius;
  final bool? onWillPopActive;

  final Widget? closeWidget;

  final ButtonsDirection? buttonDirection;

  final TextStyle? titleStyle;

  CustomDialogAlert(
    this.context, {
    required this.customBody,
    this.buttonPadding,
    this.borderRadius,
    this.closeWidget,
    this.title,
    this.titleStyle,
    this.onWillPopActive,
    this.buttonDirection,
    this.yesButton,
    this.noButton,
  });

  List<DialogButton>? get _buttons {
    if (noButton != null && yesButton != null) {
      return [noButton!.button, yesButton!.button];
    } else if (noButton != null) {
      return [noButton!.button];
    } else if (yesButton != null) {
      return [yesButton!.button];
    } else {
      return [CustomDialogButton().button];
    }
  }

  show() {
    return Alert(
            onWillPopActive: onWillPopActive ?? false,
            closeIcon: closeWidget,
            context: context,
            style: AlertStyle(
              titleStyle: titleStyle ??
                  const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal),
              alertBorder: RoundedRectangleBorder(
                borderRadius: borderRadius ?? BorderRadius.circular(10.0),
                side: const BorderSide(
                  color: Colors.transparent,
                ),
              ),
              alertAlignment: Alignment.center,
              isCloseButton: closeWidget != null,
              buttonAreaPadding: buttonPadding ?? EdgeInsets.zero,
              overlayColor: Colors.black38,
              alertPadding: const EdgeInsets.all(16),
              buttonsDirection: buttonDirection ?? ButtonsDirection.row,
            ),
            title: title,
            content: customBody,
            buttons: _buttons)
        .show();
  }
}
