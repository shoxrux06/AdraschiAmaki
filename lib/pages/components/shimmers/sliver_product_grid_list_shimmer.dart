import 'package:flutter/material.dart';

import 'make_shimmer.dart';

class SliverProductGridListShimmer extends StatelessWidget {
  final int itemCount;
  final double verticalPadding;

  const SliverProductGridListShimmer({
    Key? key,
    this.itemCount = 6,
    this.verticalPadding = 20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 15,
        crossAxisSpacing: 15,
        childAspectRatio: 0.60,
      ),
      delegate: SliverChildBuilderDelegate((context, index) {
        return MakeShimmer(
          child: Container(
            width: 168,
            height: 170,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
            ),
          ),
        );
      }, childCount: 20),
    );
  }
}
