import 'dart:convert';

import 'package:afisha_market/core/data/repository/order_repository.dart';
import 'package:afisha_market/core/data/source/remote/response/orders_response.dart';
import 'package:afisha_market/core/data/source/remote/response/status_and_message_response.dart';
import 'package:afisha_market/core/handlers/api_result.dart';
import 'package:dio/dio.dart';

import '../../../di/inject.dart';
import '../../../handlers/http_service.dart';
import '../../../handlers/network_exceptions.dart';
import '../../../utils/app_helpers.dart';

class OrderRepositoryImpl implements OrderRepository{
  @override
  Future<ApiResult<OrdersResponse>> getOrders() async{
    try {
      final client = inject<HttpService>().client(requireAuth: true);
      final response = await client.get(
        '/admin/orders',
      );
      return ApiResult.success(data: OrdersResponse.fromJson(response.data));
    } catch (e) {
      print('==> orders failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<Order>> getOrderDetails(int productId) async{
    try {
      final client = inject<HttpService>().client(requireAuth: true);
      final response = await client.get(
        '/admin/orders/$productId',
      );
      final newResult = response.data.toList().asMap();
      final map = Map.from(newResult);
      print('ssss1 $map');
      print('ssss2 ${map.values.first}');
      return ApiResult.success(data: Order.fromJson(map.values.first));
    } catch (e) {
      print('==> orders failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<StatusAndMessageResponse>> acceptOrder(int orderId) async{
    try {
      var json =  {
        "qabul": true
      };
      final client = inject<HttpService>().client(requireAuth: true);
      final response = await client.put(
        '/admin/orders/$orderId',
        data: jsonEncode(json)
      );
      return ApiResult.success(data: StatusAndMessageResponse.fromJson(response.data));
    } on DioError catch(e){
      print(e.response);
      // AppHelpers.showCheckFlash(context, e.response?.data['message']??'No message');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
    catch (e) {
      print('==>create products failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

}