import 'package:afisha_market/core/data/source/remote/response/orders_response.dart';
import 'package:afisha_market/core/data/source/remote/response/status_and_message_response.dart';
import '../../handlers/api_result.dart';

abstract class OrderRepository{
  Future<ApiResult<OrdersResponse>> getOrders();
  Future<ApiResult<Order>> getOrderDetails(int productId);
  Future<ApiResult<StatusAndMessageResponse>> acceptOrder(int orderId);
}