/*
 * @LastEditors: hezeying@xdf.cn
 * @Date: 2025-04-06 18:58:57
 * @LastEditTime: 2025-04-07 17:47:33
 * @FilePath: /flutter_woo_2025/lib/pages/styles/styles_index/controller.dart
 * @Description: 
 */
import 'package:flutter_woo_2025/common/index.dart';
import 'package:get/get.dart';

class StylesIndexController extends GetxController {
  StylesIndexController();

  _initData() {
    update(["styles_index"]);
  }

  void onTap() {}

  // 多语言
  onLanguageSelected() {
    var en = Translation.supportedLocales[0];
    var zh = Translation.supportedLocales[1];

    ConfigService.to.setLanguage(
        ConfigService.to.locale.toLanguageTag() == en.toLanguageTag()
            ? zh
            : en);
    update(["styles_index"]);
  }

  // 主题
  onThemeSelected(String themeKey) async {
    await ConfigService.to.setThemeMode(themeKey);
    update(["styles_index"]);
  }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }
}
