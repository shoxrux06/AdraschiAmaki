import 'package:afisha_market/core/handlers/api_result.dart';
import '../source/remote/response/GetProfileResponse.dart';
import '../source/remote/response/ProductResponse.dart';
import '../source/remote/response/material_type_response.dart';

abstract class FilterRepository {
  Future<ApiResult<MaterialTypeResponse>> getProductByMaterialType();
  Future<ApiResult<List<Product>>> getProductByCategory(int id);
}
