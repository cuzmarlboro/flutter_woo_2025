import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'common/index.dart';

class Global {
  static Future<void> init() async {
    // 插件初始化
    WidgetsFlutterBinding.ensureInitialized();

    // 工具类
    await Storage().init();

    // 初始化服务
    Get.put<ConfigService>(ConfigService()); // 全局配置服务
    Get.put<WPHttpService>(WPHttpService()); // 网络请求

    // 初始化配置
    await ConfigService.to.init();
  }
}
