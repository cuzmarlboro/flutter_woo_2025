/*
 * @LastEditors: hezeying@xdf.cn
 * @Date: 2025-04-06 18:58:57
 * @LastEditTime: 2025-04-08 15:31:16
 * @FilePath: /flutter_woo_2025/lib/pages/styles/styles_index/view.dart
 * @Description: 
 */
import 'package:flutter/material.dart';
import 'package:flutter_woo_2025/common/index.dart';
import 'package:get/get.dart';

import 'index.dart';

class StylesIndexPage extends GetView<StylesIndexController> {
  const StylesIndexPage({super.key});

  // 主视图
  Widget _buildView() {
    return Column(
      children: [
        // form 表单
        ListTile(
          onTap: () => Get.toNamed(RouteNames.stylesTextForm),
          title: const Text("form 表单"),
        ),
        // Input 输入框
        ListTile(
          onTap: () => Get.toNamed(RouteNames.stylesInputsIndex),
          title: const Text("Input 输入框"),
        ),
        // 按钮
        ListTile(
          onTap: () => Get.toNamed(RouteNames.stylesButtonsIndex),
          title: const Text("Button 按钮"),
        ),
        // 图标
        ListTile(
          onTap: () => Get.toNamed(RouteNames.stylesIconIndex),
          title: const Text("Icon 图标"),
        ),
        // 图片
        ListTile(
          onTap: () => Get.toNamed(RouteNames.stylesImageIndex),
          title: const Text("Image 图片"),
        ),
        // 文本
        ListTile(
          onTap: () => Get.toNamed(RouteNames.stylesTextIndex),
          title: const Text("Text 文本"),
        ),
        // 语言
        ListTile(
          onTap: controller.onLanguageSelected,
          title: Text(
            "语言 : ${ConfigService.to.locale.toLanguageTag()}",
          ),
        ),
        // 主题
        ListTile(
          onTap: () => controller.onThemeSelected("light"),
          title: Text("亮色 : ${ConfigService.to.themeMode}"),
        ),
        ListTile(
          onTap: () => controller.onThemeSelected("dark"),
          title: Text("暗色 : ${ConfigService.to.themeMode}"),
        ),
        ListTile(
          onTap: () => controller.onThemeSelected("system"),
          title: Text("系统 : ${ConfigService.to.themeMode}"),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StylesIndexController>(
      init: StylesIndexController(),
      id: "styles_index",
      builder: (_) {
        return Scaffold(
          // appBar: AppBar(title: const Text("styles_index")),
          appBar: AppBar(title: Text(LocaleKeys.stylesTitle.tr)),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
