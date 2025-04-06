import 'package:flutter/material.dart';
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
    return GetMaterialApp(
      // 标题
      title: 'Flutter Demo',

      // 主题
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple), // 主题色
        useMaterial3: false, // 不使用Material3
      ),

      // 路由
      // initialRoute: RouteNames.systemSplash,
      initialRoute: RouteNames.stylesStylesIndex,
      getPages: RoutePages.list,
      navigatorObservers: [RoutePages.observer],

      // 多语言
      translations: Translation(), // 词典
      localizationsDelegates: Translation.localizationsDelegates, // 代理
      supportedLocales: Translation.supportedLocales, // 支持的语言种类
      locale: ConfigService.to.locale, // 当前语言种类
      fallbackLocale: Translation.fallbackLocale, // 默认语言种类
    );
  }
}
