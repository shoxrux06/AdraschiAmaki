import 'package:afisha_market/core/data/source/local/hive/hive.dart';
import 'package:afisha_market/core/utils/local_storage.dart';
import 'package:dio/dio.dart';


class TokenInterceptor extends Interceptor {
  final bool requireAuth;

  TokenInterceptor({required this.requireAuth});

  @override
  void onRequest(
      RequestOptions options,
      RequestInterceptorHandler handler,
      ) async {
    final String token = LocalStorage.instance.getToken()??'';
    print('token<$token>');

    if (token.isNotEmpty && requireAuth) {
      options.headers.addAll({'Authorization': 'Bearer $token'});
    }
    handler.next(options);
  }
}
