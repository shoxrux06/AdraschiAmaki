import 'package:afisha_market/core/data/source/remote/response/AdvertisementResponse.dart';
import 'package:afisha_market/core/data/source/remote/response/ProductResponse.dart';
import 'package:afisha_market/core/data/source/remote/response/RegionResponse.dart';
import 'package:afisha_market/core/handlers/api_result.dart';

import '../source/remote/response/GetProfileResponse.dart';

abstract class HomeRepository{
  Future<ApiResult<ProductResponse>> getProductList({int page = 1, String search = ""});
  Future<ApiResult<AdvertisementResponse>> getAds();
  Future<ApiResult<int>> getViews();
  // Future<ApiResult<RegionResponse>> getRegionList();
  Future<ApiResult<List<ProductDetail>>> getProductByRegion(int id);

}