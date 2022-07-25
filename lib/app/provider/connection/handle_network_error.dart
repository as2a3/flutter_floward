import 'package:flutter_floward/app/provider/connection/network_exceptions.dart';
import 'package:flutter_floward/common/ui.dart';
import 'package:get/get.dart';

void handleAPIErrorUI(
  NetworkExceptions error, {
  Function(String)? fail,
  bool showMessage = false,
  bool handleAccessTokenExpiration = true,
}) {
  final String msg = handleNetworkExceptions(
    error,
    handleUnauthorisedRequest: !handleAccessTokenExpiration,
  );
  fail?.call(msg);
  if (showMessage) {
    showToastMessage(message: msg);
  }
}

String handleNetworkExceptions(
  NetworkExceptions error, {
  bool handleUnauthorisedRequest = true,
  bool handleNoInternetConnection = true,
}) {
  String message = getErrorMessage(
    error,
  );
  error.when(
    requestCancelled: () {},
    unauthorisedRequest: () {
      if (handleUnauthorisedRequest) {
        message = 'Invalid Phone Number or Password'.tr;
      }
    },
    badRequest: () {},
    notFound: (reason) {},
    methodNotAllowed: () {},
    notAcceptable: () {},
    requestTimeout: () {},
    sendTimeout: () {},
    conflict: () {},
    internalServerError: () {},
    notImplemented: () {},
    serviceUnavailable: () {},
    noInternetConnection: () {},
    formatException: () {},
    unableToProcess: () {},
    defaultError: (reason) {
      message = getErrorMessage(error);
    },
    unexpectedError: () {},
  );
  return message;
}
