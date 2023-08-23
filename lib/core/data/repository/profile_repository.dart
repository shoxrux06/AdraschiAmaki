import 'dart:io';

import 'package:afisha_market/core/data/source/remote/response/GetProfileResponse.dart';
import 'package:afisha_market/core/data/source/remote/response/ProductOwnerResponse.dart';
import 'package:afisha_market/core/data/source/remote/response/update_profile_response.dart';
import 'package:afisha_market/core/handlers/api_result.dart';
import 'package:flutter/cupertino.dart';

abstract class ProfileRepository{
  Future<ApiResult<GetProfileResponse>> getProfile();
  Future<ApiResult<ProductOwnerResponse>> openOwnerProfile(int id);
  Future<ApiResult<UpdateProfileResponse>> updateProfile(BuildContext context, String fullName, String password, File? avatar);
}