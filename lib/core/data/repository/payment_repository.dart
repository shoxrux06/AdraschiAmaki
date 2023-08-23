import 'package:afisha_market/core/data/source/remote/response/payment_response.dart';
import 'package:flutter/cupertino.dart';
import '../../handlers/api_result.dart';

abstract class PaymentRepository{
  Future<ApiResult<PaymentResponse>> createTransaction(BuildContext context,String amount, String secretCode);
}