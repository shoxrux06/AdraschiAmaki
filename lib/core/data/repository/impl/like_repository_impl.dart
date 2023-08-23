import 'package:afisha_market/core/data/repository/like_repository.dart';
import 'package:afisha_market/core/data/source/remote/response/liked_response.dart';
import 'package:afisha_market/core/data/source/remote/response/unliked_response.dart';
import 'package:afisha_market/core/handlers/api_result.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../../../di/inject.dart';
import '../../../handlers/http_service.dart';
import '../../../handlers/network_exceptions.dart';
import '../../../utils/app_helpers.dart';

class LikeRepositoryImpl implements LikeRepository{
  @override
  Future<ApiResult<LikedResponse>> onProductLiked(BuildContext context,int productId)async {
    try {
      final client = inject<HttpService>().client(requireAuth: true);
      final response = await client.post('/products/$productId/like');
      return ApiResult.success(data: LikedResponse.fromJson(response.data));
    } on DioError catch (e) {
      print('==> Create liked failure: $e');
      AppHelpers.showCheckFlash(context, e.response?.data['message']);
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    } catch (e) {
      print('==> Create liked failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<UnLikedResponse>> onProductUnLiked(BuildContext context, int productId) async{
    try {
      final client = inject<HttpService>().client(requireAuth: true);
      final response = await client.delete('/products/$productId/unlike');
      return ApiResult.success(data: UnLikedResponse.fromJson(response.data));
    } on DioError catch (e) {
      print('==> Create UnLikedResponse failure: $e');
      AppHelpers.showCheckFlash(context, e.response?.data['message']);
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    } catch (e) {
      print('==> Create UnLikedResponse failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

}