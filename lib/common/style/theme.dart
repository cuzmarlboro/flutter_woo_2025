/*
 * @LastEditors: hezeying@xdf.cn
 * @Date: 2025-04-07 17:07:14
 * @LastEditTime: 2025-04-09 23:52:36
 * @FilePath: /flutter_woo_2025/lib/common/style/theme.dart
 * @Description: 主题
 */
import 'package:ducafe_ui_core/ducafe_ui_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'colors.dart';

/// 主题
class AppTheme {
  /////////////////////////////////////////////////
  /// 系统样式
  /////////////////////////////////////////////////

  /// 系统样式
  static SystemUiOverlayStyle get systemStyle => const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, // 状态栏颜色
        statusBarBrightness: Brightness.light, // 状态栏亮度
        statusBarIconBrightness: Brightness.dark, // 状态栏图标亮度
        systemNavigationBarDividerColor: Colors.transparent, // 系统导航栏分隔线颜色
        systemNavigationBarColor: Colors.white, // 系统导航栏颜色
        systemNavigationBarIconBrightness: Brightness.dark, // 系统导航栏图标亮度
      );

  /// 亮色系统样式
  static SystemUiOverlayStyle get systemStyleLight => systemStyle.copyWith(
        statusBarBrightness: Brightness.light, // 状态栏亮度
        statusBarIconBrightness: Brightness.dark, // 状态栏图标亮度
        systemNavigationBarIconBrightness: Brightness.dark, // 系统导航栏图标亮度
      );

  /// 暗色系统样式
  static SystemUiOverlayStyle get systemStyleDark => systemStyle.copyWith(
        statusBarBrightness: Brightness.dark, // 状态栏亮度
        statusBarIconBrightness: Brightness.light, // 状态栏图标亮度
        systemNavigationBarColor: const Color(0xFF0D0D0D), // 系统导航栏颜色
        systemNavigationBarIconBrightness: Brightness.light, // 系统导航栏图标亮度
      );

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

  static void setSystemStyle() {
    // 获取系统亮度
    Brightness platformBrightness =
        Get.context?.theme.brightness ?? Brightness.light;

    // 获取当前模式
    ThemeMode mode = Get.isDarkMode ? ThemeMode.dark : ThemeMode.light;

    switch (mode) {
      case ThemeMode.system:
        if (platformBrightness == Brightness.dark) {
          // 暗色模式
          SystemChrome.setSystemUIOverlayStyle(systemStyleDark);
        } else {
          // 亮色模式
          SystemChrome.setSystemUIOverlayStyle(systemStyleLight);
        }
        break;
      case ThemeMode.light:
        // 亮色模式
        SystemChrome.setSystemUIOverlayStyle(systemStyleLight);
        break;
      case ThemeMode.dark:
        // 暗色模式
        SystemChrome.setSystemUIOverlayStyle(systemStyleDark);
        break;
    }
  }

  /// 获取主题
  static ThemeData _getTheme(ColorScheme scheme) {
    return ThemeData(
      useMaterial3: false, // 不使用Material3
      colorScheme: scheme, // 主题色
      fontFamily: "Montserrat", // 字体

      // 导航栏
      appBarTheme: AppBarTheme(
        // backgroundColor: scheme.surface, // 背景色
        backgroundColor: Colors.transparent, // 背景色

        // 系统状态栏样式
        systemOverlayStyle: Get.context?.platformBrightness() == Brightness.dark
            ? SystemUiOverlayStyle.light
            : SystemUiOverlayStyle.dark,

        scrolledUnderElevation: 0, // 滚动阴影
        elevation: 0, // 阴影
        centerTitle: true, // 标题居中
        toolbarHeight: 56.w, // 高度
        iconTheme: IconThemeData(
          color: scheme.onSurface, // 图标颜色
          size: 22.w, // 图标大小
        ),
        titleTextStyle: TextStyle(
          color: scheme.onSurface, // 字体颜色
          fontSize: 24.w, // 字体大小
          fontWeight: FontWeight.w600, // 字体粗细
          height: 1.2, // 行高
        ),
        toolbarTextStyle: TextStyle(
          color: scheme.onSurface, // 字体颜色
          fontSize: 22.w, // 字体大小
          fontWeight: FontWeight.w600, // 字体粗细
          height: 1.2, // 行高
        ),
      ),
    );
  }
}
