import 'package:afisha_market/core/data/source/remote/response/orders_response.dart';
import 'package:afisha_market/core/data/source/remote/response/status_and_message_response.dart';

import '../../data/source/remote/response/orders_response.dart';

class OrdersState {
  final OrdersResponse? ordersResponse;
  final Order? orderDetails;
  final StatusAndMessageResponse? statusAndMessageResponse;
  final bool isAccepting;
  final bool isAccepted;

  OrdersState({
    this.ordersResponse,
    this.orderDetails,
    this.statusAndMessageResponse,
    this.isAccepting = false,
    this.isAccepted = false,
  });

  OrdersState copyWith({
    OrdersResponse? ordersResponse,
    Order? orderDetails,
    StatusAndMessageResponse? statusAndMessageResponse,
    bool? isAccepting,
    bool? isAccepted,
  }) {
    return OrdersState(
      ordersResponse: ordersResponse ?? this.ordersResponse,
      orderDetails: orderDetails ?? this.orderDetails,
      statusAndMessageResponse: statusAndMessageResponse?? this.statusAndMessageResponse,
      isAccepting: isAccepting?? this.isAccepting,
      isAccepted: isAccepted?? this.isAccepted,
    );
  }
}
