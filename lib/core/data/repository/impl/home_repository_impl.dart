import 'package:afisha_market/core/data/repository/home_repository.dart';
import 'package:afisha_market/core/data/source/remote/response/AdvertisementResponse.dart';
import 'package:afisha_market/core/data/source/remote/response/GetProfileResponse.dart';
import 'package:afisha_market/core/data/source/remote/response/ProductResponse.dart';
import 'package:afisha_market/core/data/source/remote/response/RegionResponse.dart';
import 'package:afisha_market/core/di/inject.dart';
import 'package:afisha_market/core/handlers/api_result.dart';
import 'package:afisha_market/core/handlers/http_service.dart';
import 'package:afisha_market/core/handlers/network_exceptions.dart';

class HomeRepositoryImpl extends HomeRepository{
  @override
  Future<ApiResult<ProductResponse>> getProductList({int page = 1, String search = ""}) async {
    Future.delayed(Duration(seconds: 10));
    try {
      final client = inject<HttpService>().client(requireAuth: true);
      final response = await client.get(
        '/products?q=$search&page=$page',
      );
      return ApiResult.success(data: ProductResponse.fromJson(response.data));
    } catch (e) {
      print('==> products failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }
  @override
  Future<ApiResult<AdvertisementResponse>> getAds() async{
    try {
      final client = inject<HttpService>().client(requireAuth: false);
      final response = await client.get(
        '/reklama',
      );
      return ApiResult.success(data: AdvertisementResponse.fromJson(response.data));
    } catch (e) {
      print('==> reklama failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }
  @override
  Future<ApiResult<int>> getViews() async{
    try {
      final client = inject<HttpService>().client(requireAuth: true);
      final response = await client.get(
        '/home',
      );
      var viewResponse = response.data["views"] as int;
      return ApiResult.success(data: viewResponse);
    } catch (e) {
      print('==> home failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  // @override
  // Future<ApiResult<RegionResponse>> getRegionList() async{
  //   try {
  //     final client = inject<HttpService>().client(requireAuth: true);
  //     final response = await client.get(
  //       '/regions',
  //     );
  //     return ApiResult.success(data: RegionResponse.fromJson(response.data));
  //   } catch (e) {
  //     print('==> regions failure: $e');
  //     return ApiResult.failure(error: NetworkExceptions.getDioException(e));
  //   }
  // }

  @override
  Future<ApiResult<List<ProductDetail>>> getProductByRegion(int id) {
    // TODO: implement getProductByRegion
    throw UnimplementedError();
  }

}