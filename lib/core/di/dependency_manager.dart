import 'package:afisha_market/core/data/repository/adv_repository.dart';
import 'package:afisha_market/core/data/repository/auth_repository.dart';
import 'package:afisha_market/core/data/repository/filter_repository.dart';
import 'package:afisha_market/core/data/repository/home_repository.dart';
import 'package:afisha_market/core/data/repository/impl/adv_repository_impl.dart';
import 'package:afisha_market/core/data/repository/impl/auth_repository_impl.dart';
import 'package:afisha_market/core/data/repository/impl/filter_repository_impl.dart';
import 'package:afisha_market/core/data/repository/impl/home_repository_impl.dart';
import 'package:afisha_market/core/data/repository/impl/like_repository_impl.dart';
import 'package:afisha_market/core/data/repository/impl/notification_repository_impl.dart';
import 'package:afisha_market/core/data/repository/impl/order_repository_impl.dart';
import 'package:afisha_market/core/data/repository/impl/payment_repository_impl.dart';
import 'package:afisha_market/core/data/repository/impl/product_repository_impl.dart';
import 'package:afisha_market/core/data/repository/like_repository.dart';
import 'package:afisha_market/core/data/repository/notifications_respository.dart';
import 'package:afisha_market/core/data/repository/order_repository.dart';
import 'package:afisha_market/core/data/repository/payment_repository.dart';
import 'package:afisha_market/core/data/repository/product_repository.dart';
import 'package:afisha_market/core/handlers/http_service.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

setUpDependencies(){
  getIt.registerLazySingleton<HttpService>(() => HttpService());
  getIt.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl());
  getIt.registerLazySingleton<FilterRepository>(() => FilterRepositoryImpl());
  getIt.registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl());
  getIt.registerLazySingleton<AdvRepository>(() => AdvRepositoryImpl());
  getIt.registerLazySingleton<PaymentRepository>(() => PaymentRepositoryImpl());
  getIt.registerLazySingleton<ProductRepository>(() => ProductRepositoryImpl());
  getIt.registerLazySingleton<OrderRepository>(() => OrderRepositoryImpl());
  getIt.registerLazySingleton<NotificationsRepository>(() => NotificationRepositoryImpl());
  getIt.registerLazySingleton<LikeRepository>(() => LikeRepositoryImpl());
}
final authRepository = getIt.get<AuthRepository>();
final filterRepository = getIt.get<FilterRepository>();
final homeRepository = getIt.get<HomeRepository>();
final advRepository = getIt.get<AdvRepository>();
final notificationRepository = getIt.get<NotificationsRepository>();
final paymentRepository = getIt.get<PaymentRepository>();
final productRepository = getIt.get<ProductRepository>();
final ordersRepository = getIt.get<OrderRepository>();
final likeRepository = getIt.get<LikeRepository>();