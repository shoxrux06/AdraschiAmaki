import 'package:afisha_market/core/bloc/orders/orders_bloc.dart';
import 'package:afisha_market/core/bloc/orders/orders_event.dart';
import 'package:afisha_market/core/bloc/orders/orders_state.dart';
import 'package:afisha_market/pages/orders/widgets/order_product_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../utils/custom_button_two.dart';

class OrderDetailsPage extends StatefulWidget {
  final int orderId;

  const OrderDetailsPage({super.key, required this.orderId});

  @override
  State<OrderDetailsPage> createState() => _OrderDetailsPageState();
}

class _OrderDetailsPageState extends State<OrderDetailsPage> {
  int totalSum = 0;
  @override
  void initState() {
    context.read<OrdersBloc>().add(OrderDetailsEvent(widget.orderId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrdersBloc, OrdersState>(
      builder: (context, state) {
        if(state.orderDetails == null){
          return Scaffold(
            body: Center(child: CircularProgressIndicator(),),
          );
        }
        state.orderDetails?.products.forEach((product) {
          totalSum+=(int.parse(product.pivot.quantity) * int.parse(product.price));
        });
        print('state.orderDetails <${state.orderDetails}>');
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  physics: ScrollPhysics(),
                  child: Column(
                    children: [
                      ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: state.orderDetails?.products.length,
                        itemBuilder: (context, index) {
                         return OrderProductItems(product: state.orderDetails!.products[index]);
                        },
                      ),
                      // Text('${state.orderDetails?.total}'),
                      // Text('${state.orderDetails?.user.firstName} ${state.orderDetails?.user.lastName}'),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: const [
                      BoxShadow(color: Colors.black12, blurRadius: 4)
                    ]
                ),
                child: Column(
                  children: [
                    SizedBox(height: 8,),
                    Row(children: [
                      Expanded(child: Text('Jami:')),
                      Text('$totalSum som',style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                    ],),
                    SizedBox(height: 8,),
                    BlocConsumer<OrdersBloc,OrdersState>(builder: (context,state){
                      return CustomButtonTwo(
                       'Qabul qilish',
                        isLoading: state.isAccepting,
                        onTap: () {
                          context.read<OrdersBloc>().add(OrderAcceptEvent(widget.orderId));
                        },
                      );
                    }, listener: (context,state){
                      if(state.isAccepted){
                        Navigator.of(context).pop();
                      }
                    }),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
