/*
 * @LastEditors: hezeying@xdf.cn
 * @Date: 2025-04-05 23:52:43
 * @LastEditTime: 2025-04-08 17:41:23
 * @FilePath: /flutter_woo_2025/lib/main.dart
 * @Description: 
 */
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:ducafe_ui_core/ducafe_ui_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import 'common/index.dart';
import 'global.dart';

void main() async {
  await Global.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896), // 设计稿中设备的尺寸(单位随意,建议dp,但在使用过程中必须保持一致)
      splitScreenMode: false, // 支持分屏尺寸
      minTextAdapt: false, // 是否根据宽度/高度中的最小值适配文字
      // 构建
      builder: (context, child) => AdaptiveTheme(
        // 样式
        light: AppTheme.light, // 亮色主题
        dark: AppTheme.dark, // 暗色主题
        initial: ConfigService.to.themeMode, // 初始主题
        // debugShowFloatingThemeButton: true, // 显示主题按钮

        // 构建
        builder: (theme, darkTheme) => GetMaterialApp(
          // 标题
          title: 'Flutter Demo',

          // 主题
          theme: theme,
          darkTheme: darkTheme,

          // 路由
          initialRoute: RouteNames.systemSplash,
          // initialRoute: RouteNames.stylesStylesIndex,

          getPages: RoutePages.list,
          navigatorObservers: [RoutePages.observer],

          // 多语言
          translations: Translation(), // 词典
          localizationsDelegates: Translation.localizationsDelegates, // 代理
          supportedLocales: Translation.supportedLocales, // 支持的语言种类
          locale: ConfigService.to.locale, // 当前语言种类
          fallbackLocale: Translation.fallbackLocale, // 默认语言种类

          // builder
          builder: (context, widget) {
            widget = EasyLoading.init()(context, widget); // EasyLoading 初始化

            // 不随系统字体缩放比例
            return MediaQuery(
              data: MediaQuery.of(context)
                  .copyWith(textScaler: const TextScaler.linear(1.0)),
              child: widget,
            );
          },

          // 隐藏 debug 标志
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
