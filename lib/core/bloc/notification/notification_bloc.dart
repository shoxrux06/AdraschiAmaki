import 'dart:async';
import 'package:afisha_market/core/bloc/notification/notification_event.dart';
import 'package:afisha_market/core/bloc/notification/notification_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repository/notifications_respository.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  final NotificationsRepository notificationsRepository;

  NotificationBloc(this.notificationsRepository) : super(NotificationState()) {
    on(getAllNotifications);
    on(getReadNotifications);
    on(getUnReadNotifications);
    on(readNotifications);
  }

  FutureOr<void> getAllNotifications(
    GetAllNotificationsEvent event,
    Emitter<NotificationState> emit,
  ) async {
    try {
      emit(state.copyWith());
      final response = await notificationsRepository.getAllNotifications();
      response.when(
        success: (data) {
          emit(state.copyWith(notificationResponse: data));
        },
        failure: (failure) {},
      );
    } catch (e) {}
  }

  FutureOr<void> getReadNotifications(
    GetReadNotificationsEvent event,
    Emitter<NotificationState> emit,
  ) async {
    try {
      emit(state.copyWith());
      final response = await notificationsRepository.getReadNotifications();
      response.when(
        success: (data) {
          emit(state.copyWith(readNotificationResponse: data));
        },
        failure: (failure) {},
      );
    } catch (e) {}
  }

  FutureOr<void> getUnReadNotifications(
    GetUnReadNotificationsEvent event,
    Emitter<NotificationState> emit,
  ) async {
    try {
      emit(state.copyWith());
      final response = await notificationsRepository.getUnReadNotifications();
      response.when(
        success: (data) {
          emit(state.copyWith(unReadNotificationResponse: data));
        },
        failure: (failure) {},
      );
    } catch (e) {}
  }

  FutureOr<void> readNotifications(
    ReadNotificationEvent event,
    Emitter<NotificationState> emit,
  ) async {
    try {
      emit(state.copyWith());
      final response = await notificationsRepository.readNotifications(event.notificationId);
      response.when(
        success: (data) {
          emit(state.copyWith(statusAndMessageResponse: data, isRead: true));
        },
        failure: (failure) {},
      );
    } catch (e) {}
  }
}
