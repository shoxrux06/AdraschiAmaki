import 'package:afisha_market/core/data/repository/auth_repository.dart';
import 'package:afisha_market/core/data/source/remote/request/ForgotPasswordRequest.dart';
import 'package:afisha_market/core/data/source/remote/request/ResetPasswordRequest.dart';
import 'package:afisha_market/core/data/source/remote/request/SignInRequest.dart';
import 'package:afisha_market/core/data/source/remote/request/SignUpRequest.dart';
import 'package:afisha_market/core/data/source/remote/request/VerifyRequest.dart';
import 'package:afisha_market/core/data/source/remote/response/SignInResponse.dart';
import 'package:afisha_market/core/data/source/remote/response/VerifyResponse.dart';
import 'package:afisha_market/core/di/inject.dart';
import 'package:afisha_market/core/handlers/api_result.dart';
import 'package:afisha_market/core/handlers/http_service.dart';
import 'package:afisha_market/core/handlers/network_exceptions.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../../../utils/app_helpers.dart';
import '../../source/remote/response/status_and_message_response.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<ApiResult<SignInResponse>> signIn(
    BuildContext context,
    SignInRequest request,
  ) async {
    try {
      final client = inject<HttpService>().client(requireAuth: false);
      final response = await client.post('/login', data: request.toJson());
      return ApiResult.success(data: SignInResponse.fromJson(response.data));
    } on DioError catch (e) {
      print('==> login failure: $e');
      AppHelpers.showCheckFlash(context, e.response?.data['message'] ?? 'No message');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    } catch (e) {
      print('==> login failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }
}
