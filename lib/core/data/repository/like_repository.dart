import 'package:afisha_market/core/data/source/remote/response/liked_response.dart';
import 'package:afisha_market/core/data/source/remote/response/unliked_response.dart';
import 'package:afisha_market/core/handlers/api_result.dart';
import 'package:flutter/cupertino.dart';

abstract class LikeRepository{
  Future<ApiResult<LikedResponse>> onProductLiked(BuildContext context,int productId);
  Future<ApiResult<UnLikedResponse>> onProductUnLiked(BuildContext context, int productId);
}