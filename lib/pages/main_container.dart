import 'dart:async';
import 'package:afisha_market/core/utils/local_storage.dart';
import 'package:afisha_market/pages/add/add_screen.dart';
import 'package:afisha_market/pages/home/home_page.dart';
import 'package:afisha_market/pages/orders/orders_page.dart';
import 'package:afisha_market/pages/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'adv/adv_screen.dart';

class MainContainer extends StatefulWidget {
  final bool? isFromProfile;

  const MainContainer({Key? key, this.isFromProfile}) : super(key: key);

  @override
  State<MainContainer> createState() => _MainContainerState();
}

class _MainContainerState extends State<MainContainer> {
  late String token = LocalStorage.instance.getToken();

  late int _selectedIndex = widget.isFromProfile ?? false ? 3 : 0;

  bool canback = false;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Future<bool> _onWillPop() async {
    if (canback == true) {
      SystemChannels.platform.invokeMethod('SystemNavigator.pop');
    } else {
      setState(() {
        _selectedIndex = 0;
      });
    }

    Timer(Duration(seconds: 2), () {
      setState(() {
        canback = false;
      });
    });
    canback = true;
    return false;
  }

  late List<Widget> pages;

  @override
  void initState() {
    pages = [
      const HomePage(),
      const AdvScreen(),
      const AddScreen(),
      const OrdersPage()
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
          extendBody: true,
          backgroundColor: Colors.white,
          bottomNavigationBar: BottomNavigationBar(
            elevation: 10,
            onTap: _onItemTapped,
            currentIndex: _selectedIndex,
            selectedItemColor:  blueColor,
            type: BottomNavigationBarType.shifting,
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/home.svg',
                  colorFilter: const ColorFilter.mode(
                    Color(0xFF999999),
                    BlendMode.srcIn,
                  ),
                ),
                label: l10n?.home??'Home',
                backgroundColor: mainColor,
                activeIcon:SvgPicture.asset(
                  'assets/icons/home.svg',
                  colorFilter: ColorFilter.mode(
                    blueColor,
                    BlendMode.srcIn,
                  ),
                )
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/category.svg',
                  colorFilter: const ColorFilter.mode(
                    Color(0xFF999999),
                    BlendMode.srcIn,
                  ),
                ),
                label:l10n?.advertisement?? 'Advertise',
                backgroundColor: mainColor,
                activeIcon: SvgPicture.asset(
                  'assets/icons/category.svg',
                  colorFilter: ColorFilter.mode(
                    blueColor,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/add.svg',
                  colorFilter: const ColorFilter.mode(
                    Color(0xFF999999),
                    BlendMode.srcIn,
                  ),
                ),
                label: l10n?.product?? 'Product',
                backgroundColor: mainColor,
                activeIcon: SvgPicture.asset(
                  'assets/icons/add.svg',
                  colorFilter: ColorFilter.mode(
                    blueColor,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/icons/order.png',
                  color: Color(0xFF999999),
                  width: 24,
                  height: 24,
                  // colorFilter: const ColorFilter.mode(
                  //   Color(0xFF999999),
                  //   BlendMode.srcIn,
                  // ),
                ),
                label: l10n?.orders?? 'Orders',
                backgroundColor: mainColor,
                activeIcon: Image.asset(
                  'assets/icons/order.png',
                  color:  blueColor,
                  width: 24,
                  height: 24,
                  // colorFilter: ColorFilter.mode(
                  //   blueColor,
                  //   BlendMode.srcIn,
                  // ),
                ),
              ),
            ],
          ),
          body: pages[_selectedIndex]),
    );
  }
}
