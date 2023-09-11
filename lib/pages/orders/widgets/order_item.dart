import 'package:afisha_market/core/data/source/remote/response/orders_response.dart';
import 'package:afisha_market/pages/utils/const.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OrderItem extends StatelessWidget {
  final Order order;

  const OrderItem({required this.order, super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Container(
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                '${l10n?.order} N ${order.id}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Spacer(),
              Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(8)
                ),
                child: Center(child: Text(order.status,style: TextStyle(color: Colors.white)),),
              )
            ],
          ),
          const SizedBox(height: 12,),
          Row(
            children: [
              Text('${l10n?.clientName}'),
              Spacer(),
              Text('${order.user.firstName} ${order.user.lastName}'),
            ],
          ),

          Row(
            children: [
              Text('${l10n?.createdDate}'),
              Spacer(),
              Text('${DateFormat('dd-MM-yyyy HH:mm').format(order.createdAt)} '),
            ],
          ),
          // ...order.products.map((product) => Container(
          //   child: Column(
          //     children: [
          //       Text(product.category),
          //       Text(product.price),
          //     ],
          //   ),
          // )).toList()
        ],
      ),
    );
  }
}
