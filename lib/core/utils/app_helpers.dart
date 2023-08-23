import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../pages/utils/const.dart';

class AppHelpers {
  const AppHelpers._();

  static String? moneyFormat(String price) {
    if (price.length > 2) {
      var value = price;
      value = value.replaceAll(RegExp(r'\D'), '');
      value = value.replaceAll(RegExp(r'\B(?=(\d{3})+(?!\d))'), ' ');
      return value;
    }else{
      return price;
    }
  }


  static showSnackBar(BuildContext context,String message) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));

  static translate(BuildContext context) => AppLocalizations.of(context);

  static showCheckFlash(BuildContext context, String text) {
    return showFlash(
      context: context,
      duration: const Duration(seconds: 3),
      builder: (BuildContext context, FlashController controller) {
        return Flash(
          controller: controller,
          backgroundColor: Colors.white,
          position: FlashPosition.top,
          borderRadius: BorderRadius.circular(8),
          behavior: FlashBehavior.floating,
          margin: EdgeInsets.all(15),
          brightness: Brightness.light,
          barrierBlur: 1,
          barrierColor: Colors.black54,
          barrierDismissible: true,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Colors.black12,
                width: 2,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Text(
                text,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        );
      },
    );
  }

  static decoration({bool isHintText = false, String? text}) => InputDecoration(
        fillColor: helperColor,
        filled: true,
        hintText: isHintText?text: null,
        hintStyle: TextStyle(color: disableColor, fontWeight: FontWeight.normal, fontSize: 16),
        // prefixIcon: const Icon(Icons.not_listed_location_outlined),
        border: OutlineInputBorder(
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
      );
}
