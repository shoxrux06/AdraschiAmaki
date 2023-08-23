import 'dart:io';

import 'package:afisha_market/core/data/source/remote/response/adv_add_response.dart';
import 'package:flutter/cupertino.dart';

import '../../handlers/api_result.dart';
import '../source/remote/response/AdvertisementResponse.dart';

abstract class AdvRepository{
  Future<ApiResult<AdvAddResponse>> postAds(BuildContext context, List<File> images);
}