import 'package:book_reading_mobile_app/style/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../style/app_style.dart';
import 'custom_dialog.dart';

enum AppToastType { success, error, normal }

class AlertUtils {
  static void showLoading({Duration duration = const Duration(seconds: 10)}) async {
    final loading = Center(
      child: SizedBox(
        width: 60,
        height: 60,
        child: Container(
            decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.5))]),
            // image: DecorationImage(
            //     image: AssetImage(AppIcons.gifLynkeyLoading))),
            child: const Center(
                child: CircularProgressIndicator(
              color: Colors.white,
            ))),
      ),
    );

    Get.dialog(loading,
        barrierColor: Color(0xff0A0B0D).withOpacity(0.8), barrierDismissible: false, arguments: "app.alert.loading");
  }

  static void dismiss({String? identifier}) {
    if (Get.arguments == identifier && (Get.isDialogOpen ?? false)) {
      Get.back();
    }
  }
  static void showToastSuccess({String? message = 'Wonderful! You have completed successfully', double? maxWidth}) {
    showToast(message, AppToastType.success, maxWidth: maxWidth);
  }

  static void showToastError({String? message = 'Unknown error', double? maxWidth}) async {
    if (message == null) return;
    showToast(message, AppToastType.error, maxWidth: maxWidth);
  }

  static void showToast(String? message, AppToastType type, {double? maxWidth}) {
    final toastContainer = toastWidget(message ?? 'common_unknown_error'.tr, type, maxWidth: maxWidth);
    Get.showSnackbar(toastContainer);
  }

  static GetSnackBar toastWidget(String message, AppToastType type,
      {String? rightButtonTitle, VoidCallback? onPressedRightButton, double? maxWidth}) {
    var color = Colors.white;

    var bottomDistance = Get.mediaQuery.viewPadding.bottom > 0 ? 80 - 26 : 67 - 10;

    switch (type) {
      case AppToastType.success:
        color = AppColors.colorAppSuccess;
        break;
      case AppToastType.error:
        color = AppColors.colorAppError;
        break;
      case AppToastType.normal:
        color = Color.fromRGBO(10, 11, 13, 1);
        break;
    }

    return GetSnackBar(
        maxWidth: maxWidth,
        messageText:
            Text(message, textAlign: TextAlign.left, style: AppStyles.styleTextRegular.copyWith(color: Colors.white)),
        duration: const Duration(seconds: 3),
        margin: EdgeInsets.only(left: 20, right: 20, bottom: 60),
        borderRadius: 4,
        backgroundColor: color,
        animationDuration: const Duration(milliseconds: 600),
        forwardAnimationCurve: Curves.easeInOutCubic,
        reverseAnimationCurve: Curves.easeInOutCubic,
        mainButton: rightButtonTitle != null
            ? TextButton(
                onPressed: () {
                  onPressedRightButton?.call();
                },
                child: Text(rightButtonTitle, style: AppStyles.styleTextDescription))
            : null);
  }

  static void showCustomDialog(
      {String? title,
      String? content,
      String? desc,
      String? cancelButtonTitle,
      String? okButtonTitle,
      DialogType? type,
      VoidCallback? onOkButtonPressed,
      VoidCallback? onCancelButtonPressed,
      VoidCallback? onCloseButtonPressed,
      String? identifier}) {
    final dialog = AppCustomDialog(
        title: title,
        content: content,
        description: desc,
        type: type ?? DialogType.confirm,
        buttonOkText: okButtonTitle,
        buttonCancelText: cancelButtonTitle,
        onOkButtonPressed: () {
          dismiss();
          onOkButtonPressed?.call();
        },
        onCancelButtonPressed: () {
          dismiss();
          onCancelButtonPressed?.call();
        },
        onCloseButtonPressed: onCloseButtonPressed);
    Get.dialog(dialog, barrierColor: AppColors.colorOverlayDark, barrierDismissible: false, arguments: identifier);
  }

  static void showError(
      {String? titleError,
      String? content,
      String? desc,
      String? okButtonTitle,
      VoidCallback? onOkButtonPressed,
      VoidCallback? onCloseButtonPressed,
      String? identifier}) {
    showCustomDialog(
        title: titleError,
        content: content,
        desc: desc,
        type: DialogType.error,
        okButtonTitle: okButtonTitle,
        onOkButtonPressed: onOkButtonPressed ?? () => dismiss(identifier: identifier),
        onCloseButtonPressed: onCloseButtonPressed ?? () => dismiss(identifier: identifier));
  }
}
