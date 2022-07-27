import 'dart:async';
import 'package:posyandu_app/app/utils/errors/exceptions.dart';
import 'package:posyandu_app/app/utils/helpers/dialog_helper.dart';

void handleError(error) {
  hideLoading();
  if (error is ServerException) {
    var message = error.message;
    DialogHelper.showErroDialog(description: message);
  } else if (error is TimeoutException) {
    var message = error.message;
    DialogHelper.showErroDialog(description: message);
  } else {
    DialogHelper.showErroDialog(description: "Sistem sedang sibuk sibuk");
  }
}

showLoading([String? message]) {
  DialogHelper.showLoading(message);
}

hideLoading() {
  DialogHelper.hideLoading();
}

showSuccessDialog() {
  DialogHelper.succesDialog();
}
