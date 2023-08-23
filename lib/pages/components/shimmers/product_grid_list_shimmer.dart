import 'package:flutter/material.dart';

import 'make_shimmer.dart';


class ProductGridListShimmer extends StatelessWidget {
  final int itemCount;
  final double verticalPadding;

  const ProductGridListShimmer({
    Key? key,
    this.itemCount = 6,
    this.verticalPadding = 20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: itemCount,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 168 / 250,
        mainAxisSpacing: 10,
        crossAxisSpacing: 9,
        crossAxisCount: 2,
      ),
      padding: EdgeInsets.symmetric(vertical: verticalPadding, horizontal: 12),
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return MakeShimmer(
          child: Container(
            width: 168,
            height: 172,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }
}
