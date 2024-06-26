import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mrzg_base_app/packages/components/basic_widgets.dart';
import 'package:mrzg_base_app/packages/components/notification_banner.dart';
import 'package:mrzg_base_app/packages/extensions/extensions.dart';
import 'package:mrzg_base_app/packages/theme/theme.dart';

import 'package:top_snackbar_flutter/top_snack_bar.dart';

class NotificationBannerService {
  final GlobalKey<NavigatorState> navigatorKey;
  NotificationBannerService(this.navigatorKey) {
    assert(navigatorKey.currentContext == null,
        'NavigatorState Context is not initialized!');
  }

  BuildContext get context => navigatorKey.currentContext!;

  Timer? _debounce;

  closeBanner() {
    final sf = ScaffoldMessenger.of(context);
    _debounce?.cancel();
    sf.hideCurrentMaterialBanner();
  }

  void _showCustomBanner({
    required String message,
    required TextStyle foregroundStyle,
    required Color backgroundColor,
  }) {
    final overlay = navigatorKey.currentState?.overlay;
    if (overlay == null) {
      return;
    }
    return showTopSnackBar(
      overlay,
      NotificationBanner(
        message: message,
        foregroundStyle: foregroundStyle,
        backgroundColor: backgroundColor,
      ),
      dismissType: DismissType.onSwipe,
      displayDuration: const Duration(milliseconds: 1000),
      curve: Curves.fastLinearToSlowEaseIn,
    );
  }

  showErrorBanner(String message) {
    final foregroundStyle = context.typographyTheme.onError;
    final backgroundColor = context.colorTheme.error;

    _showCustomBanner(
      message: message,
      foregroundStyle: foregroundStyle.textStyle,
      backgroundColor: backgroundColor,
    );
  }

  showSuccessBanner(String message) {
    final foregroundStyle = context.typographyTheme.onSuccessContainer;
    final backgroundColor = context.colorTheme.successContainer;

    _showCustomBanner(
      message: message,
      foregroundStyle: foregroundStyle.textStyle,
      backgroundColor: backgroundColor,
    );
  }

  closeBottomSheet() {
    Navigator.of(context, rootNavigator: true).pop();
  }

  Future<T?> showBottomSheet<T>(Widget child) {
    return showModalBottomSheet<T>(
      useRootNavigator: true,
      useSafeArea: true,
      backgroundColor: context.colorTheme.cardBackground,
      isScrollControlled: true,
      constraints: BoxConstraints(
        minHeight: context.isNarrowWith
            ? context.vHeight * 0.4
            : context.vHeight * 0.4,
        maxHeight: context.isNarrowWith
            ? context.vHeight * 0.8
            : context.vHeight * 0.92,
        minWidth: context.isNarrowWith ? context.vWidth : 420,
        maxWidth: context.isNarrowWith ? context.vWidth : 480,
      ),
      context: context,
      builder: (context) {
        return IntrinsicHeight(
          child: BasicBottomModalSheetFrame(
            child: child,
          ),
        );
      },
    );
  }
}
