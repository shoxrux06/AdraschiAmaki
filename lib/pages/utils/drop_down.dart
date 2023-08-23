import 'package:afisha_market/core/utils/app_helpers.dart';
import 'package:afisha_market/pages/utils/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

const List<String> regionList = <String>[
  'Tashkent city',
  'Tashkent region',
  'Karakalpakistan',
  'Samarkand',
  'Bukhara',
  'Andijan',
  'Khorezm',
  'Kashkadarya',
  'Jizzakh',
  'Navoi',
  'Surkhandarya',
  'Namangan',
  'Syrdarya',
  'Fergana',
];

class MyDropDown extends StatefulWidget {
  final String? dropdownValue;
  const MyDropDown({Key? key, this.dropdownValue}) : super(key: key);

  @override
  State<MyDropDown> createState() => _MyDropDownState();
}

class _MyDropDownState extends State<MyDropDown> {
  @override
  Widget build(BuildContext context) {
    String regionsString = AppLocalizations.of(context)!.regions;
    List<String> regions = regionsString.split(':');
    String dropdownValue = regions.first;
    print('regions : $regions');
    return DropdownButtonFormField(
        value: dropdownValue,
        icon: const Icon(Icons.arrow_drop_down),
        elevation: 16,
        dropdownColor: helperColor,
        style: TextStyle(color: disableColor),
        decoration: AppHelpers.decoration(),
        items: regions.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (String? value) {
          setState(() {
            dropdownValue = value!;
          });
        }
        );
  }
}
