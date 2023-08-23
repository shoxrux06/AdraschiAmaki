import 'package:flutter/material.dart';

import 'const.dart';

class CustomButton extends StatefulWidget {
  final bool isLoading ;
  final String buttonText;
  final Function()? onTap;

  const CustomButton(
      this.buttonText, {
        this.isLoading = false,
        this.onTap,
        super.key,
      });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          width: double.infinity,
          height: 60,
          decoration: BoxDecoration(
              color: mainColor,
              borderRadius: BorderRadius.all(Radius.circular(16)),
              border: Border.all(
                width: 1,
                color: blueColor,
              )
          ),
          child: widget.isLoading? Center(child: SizedBox(width: 24,height: 24,child: CircularProgressIndicator(color: blueColor,),),):
          Center(
            child: Text(
              widget.buttonText,
              style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }
}