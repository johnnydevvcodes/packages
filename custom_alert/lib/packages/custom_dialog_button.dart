import 'package:flutter/material.dart';
import 'package:palette/palette.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class CustomDialogButton {
  final Function? onTap;
  final String? text;
  final Color? color;
  final Widget? child;

  CustomDialogButton({
    this.child,
    this.onTap,
    this.text,
    this.color,
  });

  DialogButton get button {
    return DialogButton(
      color: Colors.white10,
      child: child ??
          SizedBox(
            height: 50,
            child: InkWell(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              child: Center(
                child: Text(
                  text ?? 'Dismiss',
                  style: TextStyle(
                    color: color ?? Palette.baseBlue(),
                  ),
                ),
              ),
            ),
          ),
      onPressed: () {
        onTap!.call();
      },
    );
  }
}
