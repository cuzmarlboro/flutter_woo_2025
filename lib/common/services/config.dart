import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_woo_2025/common/index.dart';
import 'package:get/get.dart';

import 'package:package_info_plus/package_info_plus.dart';

/// 配置服务
class ConfigService extends GetxService {
  // 这是一个单例写法
  static ConfigService get to => Get.find<ConfigService>();

  // 包信息
  PackageInfo? _platform;

  // 版本号
  String get version => _platform?.version ?? '-';

  // 系统当前语言
  Locale locale = PlatformDispatcher.instance.locale;

  // 主题
  AdaptiveThemeMode themeMode = AdaptiveThemeMode.light;

  // 是否已经打开过APP
  bool get isAlreadyOpen => Storage().getBool(Constants.storageAlreadyOpen);

  // 初始化
  Future<ConfigService> init() async {
    // 获取包信息
    await getPlatform();

    // 多语言初始化
    initLocale();

    // 初始化主题
    await initTheme();

    return this;
  }

  // 获取包信息
  Future<void> getPlatform() async {
    _platform = await PackageInfo.fromPlatform();
    // 应用名称（appName）：woo2025
    // 构建号（buildNumber）：1
    // 包名（packageName）：com.ducafecat.woo2025
    // 版本号（version）：1.0.0
    // 安装商店（installerStore）：com.apple.simulator
    // 安装时间（installTime）：2025-04-07 15:07:04.452
    // 更新时间（updateTime）：2025-04-07 15:06:39.000
  }

  // 初始语言
  void initLocale() {
    // 从存储中获取语言代码
    var langCode = Storage().getString(Constants.storageLanguageCode);

    // 如果语言代码为空，则直接返回
    if (langCode.isEmpty) return;

    // 在支持的语言列表中查找与语言代码匹配的索引
    var index = Translation.supportedLocales.indexWhere((element) {
      return element.languageCode == langCode;
    });

    // 如果没有找到匹配的语言代码，则返回
    if (index < 0) return;

    // 设置当前语言为找到的支持语言
    locale = Translation.supportedLocales[index];
  }

  // 初始 theme
  Future<void> initTheme() async {
    // 从存储中获取主题模式
    final savedThemeMode = await AdaptiveTheme.getThemeMode();
    // 如果存储中没有主题模式，则使用默认主题模式
    themeMode = savedThemeMode ?? AdaptiveThemeMode.light;
  }

  // 切换 theme
  Future<void> setThemeMode(String themeKey) async {
    switch (themeKey) {
      case "light":
        AdaptiveTheme.of(Get.context!).setLight();
        break;
      case "dark":
        AdaptiveTheme.of(Get.context!).setDark();
        break;
      case "system":
        AdaptiveTheme.of(Get.context!).setSystem();
        break;
    }

    // 设置系统样式
    AppTheme.setSystemStyle();
  }

  // 更改语言
  void setLanguage(Locale value) {
    // 设置当前语言
    locale = value;

    // 更新语言
    Get.updateLocale(value);

    // 存储语言代码到本地
    Storage().setString(Constants.storageLanguageCode, value.languageCode);
  }

  // 标记已打开app
  void setAlreadyOpen() {
    Storage().setBool(Constants.storageAlreadyOpen, true);
  }
}
