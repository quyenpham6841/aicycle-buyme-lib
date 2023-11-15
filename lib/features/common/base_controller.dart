import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../network/api_error.dart';
import 'utils.dart';

const double maskOpacity = 0.3;

abstract class BaseController extends FullLifeCycleController {
  final RxBool isLoading = true.obs;

  @override
  void onInit() {
    isLoading(false);
    super.onInit();
  }

  void onRefresh() async {}

  void onLoading() async {}

  @protected
  void showError({
    String? message,
    APIErrors? error,
  }) =>
      Utils.instance.showError(
        message: message,
        error: error,
      );
  @protected
  void showSuccess(String message) => Utils.instance.showSuccess(message);

  void processUsecaseResult<T>({
    required Either<APIErrors, T> result,
    Function(T)? onSuccess,
    Function(APIErrors)? onFail,
    bool? shouldShowError,
    bool? isRefreshing,
    // RefreshController? controller,
  }) {
    result.fold((error) {
      isLoading(false);
      if (shouldShowError ?? true && error is! NoMessageError) {
        if (error is NoInternetError) {
          Utils.instance.showError(
            error: error,
            message: 'No internet',
          );
        } else {
          Utils.instance.showError(
            error: error,
            message: error.details.toString(),
          );
        }
      }
      if (onFail != null) {
        onFail(error);
      }
      // if ((controller ?? refreshController) != null && isRefreshing != null) {
      //   isRefreshing
      //       ? (controller ?? refreshController)!.refreshFailed()
      //       : (controller ?? refreshController)!.loadFailed();
      // }
    }, (data) {
      isLoading(false);
      if (onSuccess != null) {
        onSuccess(data);
      }
      // if ((controller ?? refreshController) != null && isRefreshing != null) {
      //   if (isRefreshing) {
      //     (controller ?? refreshController)!
      //         .refreshCompleted(resetFooterState: true);
      //   } else {
      //     if (data is List && data.isEmpty) {
      //       (controller ?? refreshController)!.loadNoData();
      //     } else {
      //       (controller ?? refreshController)!.loadComplete();
      //     }
      //   }
      // }
    });
  }
}
