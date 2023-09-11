import 'dart:async';

import 'package:afisha_market/core/bloc/orders/orders_event.dart';
import 'package:afisha_market/core/bloc/orders/orders_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repository/order_repository.dart';
import '../../di/inject.dart';
import '../../handlers/http_service.dart';

class OrdersBloc extends Bloc<OrdersEvent, OrdersState> {
  final OrderRepository orderRepository;

  OrdersBloc(this.orderRepository) : super(OrdersState()) {
    on(ordersInitEvent);
    on(orderDetailsEvent);
    on(orderAcceptEvent);
  }

  FutureOr<void> ordersInitEvent(
    OrdersEvent event,
    Emitter<OrdersState> emit,
  ) async {
    final response = await orderRepository.getOrders();
    response.when(
      success: (data) {
        emit(state.copyWith(ordersResponse: data));
      },
      failure: (failure) {
        print('failure <<$failure>>');
      },
    );
  }

  FutureOr<void> orderDetailsEvent(
    OrderDetailsEvent event,
    Emitter<OrdersState> emit,
  ) async {
    final response = await orderRepository.getOrderDetails(event.orderId);
    response.when(
      success: (data) {
        emit(state.copyWith(orderDetails: data));
      },
      failure: (failure) {
        print('failure <<$failure>>');
      },
    );
  }

  FutureOr<void> orderAcceptEvent(
    OrderAcceptEvent event,
    Emitter<OrdersState> emit,
  ) async {
    try{
      emit(state.copyWith(isAccepting: true));
      final response = await orderRepository.acceptOrder(event.orderId);
      response.when(
        success: (data) {
          emit(state.copyWith(statusAndMessageResponse: data, isAccepting: false, isAccepted: true));
        },
        failure: (failure) {emit(state.copyWith(isAccepting: false, isAccepted: false));
          print('failure <<$failure>>');
        },
      );
    }catch(e){

    }

  }
}
