import 'package:flutter/material.dart';

import 'colors.dart';

/// 主题
class AppTheme {
  /////////////////////////////////////////////////
  /// 自定义颜色
  /////////////////////////////////////////////////

  static const primary = Color(0xFF5F84FF); // 主色
  static const secondary = Color(0xFFFF6969); // 辅助色
  static const success = Color(0xFF23A757); // 成功色
  static const warning = Color(0xFFFF1843); // 警告色
  static const error = Color(0xFFDA1414); // 错误色
  static const info = Color(0xFF2E5AAC); // 信息色

  /////////////////////////////////////////////////
  /// 主题
  /////////////////////////////////////////////////

  /// 亮色主题
  static ThemeData get light {
    ColorScheme scheme = MaterialTheme.lightScheme().copyWith(
      primary: primary, // 主色
      onPrimary: Colors.white, // 主色文本
      secondary: secondary, // 辅助色
      onSecondary: Colors.white, // 辅助色文本
      surface: Colors.white, // 背景色
      onSurface: const Color(0xFF333333), // 背景色文本
      error: error, // 错误色
      onError: Colors.white, // 错误色文本
      //   tertiary: const Color(0xFFF4F6F9), // 三级色
      //   outline: const Color(0xFFF4F6F9), // 轮廓色
      //   shadow: const Color(0xFF5A6CEA).withOpacity(0.08), // 阴影色
    );
    return _getTheme(scheme);
  }

  /// 暗色主题
  static ThemeData get dark {
    ColorScheme scheme = MaterialTheme.darkScheme().copyWith(
      primary: primary, // 主色
      // onPrimary: Colors.white, // 主色文本
      secondary: secondary, // 辅助色
      // onSecondary: Colors.white, // 辅助色文本
      // surface: const Color(0xFF252525), // 背景色
      // onSurface: Colors.white, // 背景色文本
      error: error, // 错误色
      onError: Colors.white, // 错误色文本
      //   tertiary: const Color(0xFF141414), // 三级色
      //   outline: const Color(0xFF252525), // 轮廓色
      //   shadow: const Color(0xFF777777).withOpacity(0.08), // 阴影色
    );
    return _getTheme(scheme);
  }

  /// 获取主题
  static ThemeData _getTheme(ColorScheme scheme) {
    return ThemeData(
      useMaterial3: false, // 不使用Material3
      colorScheme: scheme, // 主题色
      fontFamily: "Montserrat", // 字体
    );
  }
}
