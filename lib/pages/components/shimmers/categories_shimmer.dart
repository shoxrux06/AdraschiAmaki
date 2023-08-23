import 'package:flutter/material.dart';

import 'make_shimmer.dart';


class CategoriesShimmer extends StatelessWidget {
  final int itemCount;
  final double verticalPadding;

  const CategoriesShimmer({
    Key? key,
    this.itemCount = 10,
    this.verticalPadding = 20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: itemCount,
        padding: EdgeInsets.symmetric(vertical: verticalPadding, horizontal: 24),
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return MakeShimmer(
            child: Container(
              width: MediaQuery.of(context).size.width-48,
              margin: const EdgeInsets.symmetric(vertical: 8),
              height: 48,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
              ),
            ),
          );
        },
      ),
    );
  }
}
