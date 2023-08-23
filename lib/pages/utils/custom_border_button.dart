import 'package:flutter/material.dart';

import 'const.dart';

class CustomBorderButton extends StatefulWidget {
  final String buttonText;
  final Function()? onTap;

  const CustomBorderButton(
      this.buttonText, {
        this.onTap,
        super.key,
      });

  @override
  State<CustomBorderButton> createState() => _CustomBorderButtonState();
}

class _CustomBorderButtonState extends State<CustomBorderButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: SizedBox(
        height: 60,
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              disabledBackgroundColor: disableColor,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                side: BorderSide(color: Colors.black, width: 1,strokeAlign: 1)
              ),
              elevation: 2),
          onPressed: widget.onTap,
          child: Text(
            widget.buttonText,
            style: const TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }
}