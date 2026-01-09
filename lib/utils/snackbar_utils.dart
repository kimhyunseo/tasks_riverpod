import 'package:flutter/material.dart';

class SnackbarUtils {
  SnackbarUtils._();

  /// 단순 메시지 스낵바
  static void showSnackBr(
    BuildContext context,
    String text, {
    Duration duration = const Duration(seconds: 2),
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
        duration: duration,
        behavior: SnackBarBehavior.floating,
        showCloseIcon: true,
      ),
    );
  }

  /// 액션 버튼이 있는 스낵바
  static void showActionSnackBar({
    required BuildContext context,
    required String text,
    required String actionLabel,
    required VoidCallback onAction,
    Duration duration = const Duration(seconds: 4),
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
        duration: duration,
        behavior: SnackBarBehavior.floating,
        action: SnackBarAction(label: actionLabel, onPressed: onAction),
      ),
    );
  }
}
