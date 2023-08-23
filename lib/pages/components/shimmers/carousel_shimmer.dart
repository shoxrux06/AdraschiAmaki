import 'package:afisha_market/pages/components/shimmers/make_shimmer.dart';
import 'package:flutter/material.dart';

class CarouselShimmer extends StatelessWidget {
  const CarouselShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MakeShimmer(child: Container(
      width: MediaQuery.of(context).size.width - 24,
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
    ));
  }
}
