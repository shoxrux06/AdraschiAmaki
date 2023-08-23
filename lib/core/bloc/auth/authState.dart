import 'dart:io';

import 'package:afisha_market/core/data/source/remote/response/SignInResponse.dart';
import 'package:afisha_market/core/data/source/remote/response/VerifyResponse.dart';
import 'package:afisha_market/core/data/source/remote/response/status_and_message_response.dart';
import 'package:afisha_market/core/handlers/network_exceptions.dart';

enum AuthStatus {
  initial,
  loading,
  error,
  success,
}

class AuthState {
  final AuthStatus status;
  final SignInResponse? signInResponse;
  final StatusAndMessageResponse? statusAndMessageResponse;
  final VerifyResponse? verifyResponse;
  final NetworkExceptions? networkExceptions;
  final bool isAuthenticating;
  final bool isSendingRequestDeleteAccount;
  final bool isSentRequestDeleteAccount;
  final bool isDeletingAccount;
  final bool isDeletedAccount;
  final bool isReseting;
  final bool isReseted;
  final bool isForgotRequestSending;
  final bool isForgotResponseReceived;
  final bool isVerified;
  final bool isVerifying;
  final bool isAuthenticated;
  final bool isErrorOccurred;
  final File? avatar;

  AuthState({
    this.status = AuthStatus.initial,
    this.signInResponse,
    this.statusAndMessageResponse,
    this.verifyResponse,
    this.networkExceptions,
    this.isAuthenticating = false,
    this.isSendingRequestDeleteAccount = false,
    this.isSentRequestDeleteAccount = false,
    this.isDeletingAccount = false,
    this.isDeletedAccount = false,
    this.isReseting = false,
    this.isReseted = false,
    this.isForgotRequestSending = false,
    this.isForgotResponseReceived = false,
    this.isVerified = false,
    this.isVerifying = false,
    this.isAuthenticated = false,
    this.isErrorOccurred = false,
    this.avatar
  });

  AuthState copyWith(
      AuthStatus? status,
      SignInResponse? signInResponse,
      StatusAndMessageResponse? statusAndMessageResponse,
      VerifyResponse? verifyResponse,
      NetworkExceptions? networkExceptions,
      bool isAuthenticating,
      bool isSendingRequestDeleteAccount,
      bool isSentRequestDeleteAccount,
      bool isDeletingAccount,
      bool isDeletedAccount,
      bool isReseting,
      bool isReseted,
      bool isForgotRequestSending,
      bool isForgotResponseReceived,
      bool isVerified,
      bool isVerifying,
      bool isAuthenticated,
      bool isErrorOccurred,
      File? avatar,
      ) =>
      AuthState(
        status: status ?? this.status,
        signInResponse: signInResponse ?? this.signInResponse,
        statusAndMessageResponse: statusAndMessageResponse ?? this.statusAndMessageResponse,
        networkExceptions: networkExceptions??this.networkExceptions,
        verifyResponse: verifyResponse,
        isAuthenticating: isAuthenticating,
        isSendingRequestDeleteAccount: isSendingRequestDeleteAccount,
        isSentRequestDeleteAccount: isSentRequestDeleteAccount,
        isDeletingAccount: isDeletingAccount,
        isDeletedAccount: isDeletedAccount,
        isReseting: isReseting,
        isReseted: isReseted,
        isForgotRequestSending: isForgotRequestSending,
        isForgotResponseReceived: isForgotResponseReceived,
        isVerified: isVerified,
        isVerifying: isVerifying,
        isAuthenticated: isAuthenticated,
        isErrorOccurred:isErrorOccurred ,
        avatar: avatar??this.avatar,
      );
}

