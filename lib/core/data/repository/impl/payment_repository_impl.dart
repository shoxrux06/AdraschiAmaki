import 'package:afisha_market/core/data/repository/payment_repository.dart';
import 'package:afisha_market/core/data/source/remote/response/payment_response.dart';
import 'package:afisha_market/core/handlers/api_result.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../../../di/inject.dart';
import '../../../handlers/http_service.dart';
import '../../../handlers/network_exceptions.dart';
import '../../../utils/app_helpers.dart';

class PaymentRepositoryImpl extends PaymentRepository {
  @override
  Future<ApiResult<PaymentResponse>> createTransaction(
    BuildContext context,
    String amount,
    String secretCode,
  ) async {
    try {
      final client = inject<HttpService>().client(requireAuth: true);
      final response = await client.post('/pay', data: {
        'amount': amount,
        'secret_code': secretCode,
      });
      return ApiResult.success(data: PaymentResponse.fromJson(response.data));
    } on DioError catch (e) {
      print('==> Create transaction failure: $e');
      AppHelpers.showCheckFlash(context, e.response?.data['message']);
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    } catch (e) {
      print('==> Create transaction failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }
}
