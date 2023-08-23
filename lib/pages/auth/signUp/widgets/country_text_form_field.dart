import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../utils/const.dart';
class CountryTextFormField extends StatefulWidget {
  final String labelText;
  final Icon? prefixIcon;
  final bool isPassword;
  final bool isEnabled;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;


  const CountryTextFormField(this.labelText, this.prefixIcon, this.controller,
      {this.isPassword = false,
        this.isEnabled = false,
        this.validator,
        this.keyboardType = TextInputType.text,
        this.inputFormatters,
        Key? key})
      : super(key: key);

  @override
  State<CountryTextFormField> createState() => _CountryTextFormFieldState();
}

class _CountryTextFormFieldState extends State<CountryTextFormField> {
  bool isVisible = false;
  final FocusScopeNode focusNode = FocusScopeNode();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.keyboardType,
      scrollPadding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      inputFormatters: widget.inputFormatters,
      validator: widget.validator,
      decoration: InputDecoration(
          hintText: widget.labelText,
          hintStyle: TextStyle(color: disableColor, fontWeight: FontWeight.normal),
          prefixIcon: widget.prefixIcon,
          fillColor: helperColor,
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            borderSide: BorderSide(color: mainColor, width: 0.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            borderSide: BorderSide(color: mainColor, width: 0.5),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            borderSide: BorderSide(color: mainColor, width: 0.5),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            borderSide: BorderSide(color: mainColor, width: 0.5),
          ),
          suffixIcon: widget.isPassword
              ? IconButton(
              onPressed: () {
                setState(() {
                  isVisible = !isVisible;
                });
              },
              icon: Icon(isVisible
                  ? CupertinoIcons.eye_fill
                  : CupertinoIcons.eye_slash_fill))
              : null),
      obscureText: widget.isPassword ? !isVisible : isVisible,
      controller: widget.controller,
      textInputAction: TextInputAction.next,
    );
  }
}

