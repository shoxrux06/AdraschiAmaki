import 'package:afisha_market/core/bloc/orders/orders_bloc.dart';
import 'package:afisha_market/core/bloc/orders/orders_event.dart';
import 'package:afisha_market/core/bloc/orders/orders_state.dart';
import 'package:afisha_market/pages/orders/widgets/order_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'order_details_page.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<OrdersBloc>().add(OrdersInitEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<OrdersBloc, OrdersState>(builder: (context, state){
        if(state.ordersResponse == null){
          return const Center(child: CircularProgressIndicator(),);
        }
        return ListView.builder(
          itemCount: state.ordersResponse?.data.length,
          itemBuilder: (context, index) {
            return GestureDetector(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) => OrderDetailsPage(orderId: state.ordersResponse!.data[index].id)));
                },
                child: OrderItem(order: state.ordersResponse!.data[index])
            );
          },
        );
      },)
    );
  }
}
