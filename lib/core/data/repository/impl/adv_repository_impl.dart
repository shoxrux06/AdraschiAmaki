import 'dart:io';

import 'package:afisha_market/core/data/repository/adv_repository.dart';
import 'package:afisha_market/core/data/source/remote/response/adv_add_response.dart';
import 'package:afisha_market/core/handlers/api_result.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../../../di/inject.dart';
import '../../../handlers/http_service.dart';
import '../../../handlers/network_exceptions.dart';
import '../../../utils/app_helpers.dart';

class AdvRepositoryImpl implements AdvRepository {
  @override
  Future<ApiResult<AdvAddResponse>> postAds(BuildContext context,List<File> images) async {
    try {
      final formData = {
        'images[]': await Future.wait(
          images.map((photo) async {
            return await MultipartFile.fromFile(photo.path);
          }),
        )
      };
      final client = inject<HttpService>().client(requireAuth: true);
      final response = await client.post('/reklama', data: FormData.fromMap(formData));
      return ApiResult.success(data: AdvAddResponse.fromJson(response.data));
    } on DioError catch (e) {
      print(e.response);
      AppHelpers.showCheckFlash(
          context, e.response?.data['message'] ?? 'No message');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    } catch (e) {
      print('==>create products failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }
}
