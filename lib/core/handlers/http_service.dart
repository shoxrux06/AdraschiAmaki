import 'dart:convert';

import 'package:afisha_market/core/constants/app_constants.dart';
import 'package:afisha_market/core/handlers/token_interceptor.dart';
import 'package:afisha_market/core/utils/local_storage.dart';
import 'package:dio/dio.dart';


class HttpService {

  Dio client({bool requireAuth = false}) => Dio(
    BaseOptions(
      baseUrl: AppConstants.baseUrl,
      connectTimeout: 60 * 1000,
      receiveTimeout: 60 * 1000,
      sendTimeout: 60 * 1000,
      headers: {
        'Accept': 'application/json',
        'Content-type': 'application/json',
        'Accept-Language': LocalStorage.instance.getLanguage(),
      },
    ),
  )
    ..interceptors.add(TokenInterceptor(requireAuth: requireAuth))
    ..interceptors.add(LogInterceptor());



}
