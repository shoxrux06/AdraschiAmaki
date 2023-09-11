import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSearchBar extends StatefulWidget {
  final Function(String searchText) search;

  const CustomSearchBar({Key? key, required this.search}) : super(key: key);

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  final _searchController = TextEditingController();

  @override
  void initState() {
    _searchController.addListener(() {
      widget.search(_searchController.text);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(15),
      ),
      margin: EdgeInsets.only(top: 15, left: 15, right: 8, bottom: 15),
      height: 50,
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
            prefixIcon: Container(
                padding: EdgeInsets.all(15),
                child: SvgPicture.asset("assets/icons/search_i.svg",
                    width: 20, height: 20)
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide( color: Colors.white, width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide( color: Colors.white, width: 1),
            ),
            hintText: AppLocalizations.of(context)?.search ?? '',
            hintStyle: TextStyle(fontSize: 15)),
      ),
    );
  }
}
