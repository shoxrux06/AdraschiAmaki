import 'package:afisha_market/pages/utils/const.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyButton extends StatelessWidget {
  final String buttonText;
  final Function()? onTap;

  const MyButton(
    this.buttonText, {
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12),
      child: SizedBox(
        height: 48,
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: textFieldColor,
              disabledBackgroundColor: disableColor,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
              elevation: 4),
          onPressed: onTap,
          child: Text(
            buttonText.tr(),
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class MyButtonTwo extends StatelessWidget {
  final String buttonText;
  final Function()? onTap;

  const MyButtonTwo(
      this.buttonText, {
        this.onTap,
        super.key,
      });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12),
      child: SizedBox(
        height: 48,
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: textFieldColor,
              disabledBackgroundColor: disableColor,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
              elevation: 4),
          onPressed: onTap,
          child: Text(
            buttonText,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class MyBigButton extends StatefulWidget {
  final String buttonText;
  final Function()? onTap;

  const MyBigButton(
    this.buttonText, {
    this.onTap,
    super.key,
  });

  @override
  State<MyBigButton> createState() => _MyBigButtonState();
}

class _MyBigButtonState extends State<MyBigButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: SizedBox(
        height: 60,
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: textFieldColor,
              disabledBackgroundColor: disableColor,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
              elevation: 2),
          onPressed: widget.onTap,
          child: Text(
            widget.buttonText.tr(),
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class MyText extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final int maxLines;

  const MyText(this.text,
      {this.color = Colors.white,
      this.fontSize = 16,
      this.fontWeight = FontWeight.normal,
      this.textAlign = TextAlign.start,
      this.maxLines = 1,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text.tr(),
      style:
          TextStyle(color: color, fontSize: fontSize, fontWeight: fontWeight),
      textAlign: textAlign,
      overflow: TextOverflow.ellipsis,
      softWrap: false,
      maxLines: maxLines,
    );
  }
}

class MyTextFormField extends StatelessWidget {
  final String labelText;
  final Icon prefixIcon;
  final bool isPassword;
  final bool isVisible;
  final bool isEnabled;
  final TextEditingController controller;
  final TextInputType keyboardType;

  const MyTextFormField(
    this.labelText,
    this.prefixIcon,
    this.controller, {
    this.isPassword = false,
    this.isVisible = false,
    this.isEnabled = false,
    this.keyboardType = TextInputType.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(color: disableColor),
          prefixIcon: prefixIcon,
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(36)),
            borderSide: BorderSide(color: textFieldColor, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(36)),
            borderSide: BorderSide(color: textFieldColor, width: 2),
          ),
          enabled: true,
          suffixIcon: isPassword
              ? Icon(isVisible
                  ? CupertinoIcons.eye_fill
                  : CupertinoIcons.eye_slash_fill)
              : null),
      obscureText: isVisible,
      controller: controller,
    );
  }
}

class MyTextFormField2 extends StatefulWidget {
  final String labelText;
  final String suffixText;
  final Icon? prefixIcon;
  final bool isPassword;
  final bool isEnabled;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final Function(String?)? onChanged;


  const MyTextFormField2(
      this.labelText,
      this.prefixIcon,
      this.controller,
      {this.isPassword = false,
      this.isEnabled = true,
      this.validator,
      this.suffixText = '',
      this.onChanged,
      this.keyboardType = TextInputType.text,
      this.inputFormatters,
      Key? key})
      : super(key: key);

  @override
  State<MyTextFormField2> createState() => _MyTextFormField2State();
}

class _MyTextFormField2State extends State<MyTextFormField2> {
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
          suffixText: widget.suffixText,
          hintText: widget.labelText,
          hintStyle: TextStyle(color: disableColor, fontWeight: FontWeight.normal),
          prefixIcon: widget.prefixIcon,
          enabled: widget.isEnabled,
          fillColor: helperColor,
          filled: true,
          disabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            borderSide: BorderSide(color: textFieldColor, width: 0.5),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            borderSide: BorderSide(color: textFieldColor, width: 0.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            borderSide: BorderSide(color: textFieldColor, width: 0.5),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            borderSide: BorderSide(color: Colors.red, width: 0.5),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            borderSide: BorderSide(color: Colors.red, width: 0.5),
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
      onChanged: widget.onChanged,
      // onFieldSubmitted: (term){
      //
      // },
    );
  }
}

class MyWrappedText extends StatefulWidget {
  final String buttonText;
  final Function()? onTap;
  final Function()? onTap2;

  const MyWrappedText(
    this.buttonText, {
    this.onTap,
    this.onTap2,
    super.key,
  });

  @override
  State<MyWrappedText> createState() => _MyWrappedTextState();
}

class _MyWrappedTextState extends State<MyWrappedText> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Container(
          height: 60,
          foregroundDecoration: BoxDecoration(shape: BoxShape.circle
              //     shape: const RoundedRectangleBorder(
              //   borderRadius: BorderRadius.all(Radius.circular(16)),
              // )
              ),
          width: double.infinity,
          child: GestureDetector(
            onTap: widget.onTap,
            onDoubleTap: widget.onTap2,
            child: Text(
              widget.buttonText,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.black, fontSize: 20),
            ),
          )),
    );
  }
}
