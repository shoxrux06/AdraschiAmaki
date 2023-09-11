import 'package:afisha_market/core/data/source/remote/response/orders_response.dart';
import 'package:afisha_market/core/utils/app_helpers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class OrderProductItems extends StatelessWidget {
  final Product product;
  const OrderProductItems({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    double height = media.height;
    double width = media.width;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          SizedBox(height: 8,),
          Row(
            children: [
              SizedBox(
                width: height/6,
                height: width/3,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: CachedNetworkImage(
                    width: height/6,
                    height: width/3,
                    imageUrl:product.photos[0],
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(width: 8,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.category,style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                  SizedBox(height: 8,),
                  Text('Price: ${AppHelpers.moneyFormat(product.price)} som'),
                  SizedBox(height: 8,),
                  Text('Quantity: ${product.pivot.quantity}'),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Divider(
            height: 1,
            color: Colors.grey,
          )
        ],
      ),
    );
  }
}
