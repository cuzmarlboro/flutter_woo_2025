/*
 * @LastEditors: hezeying@xdf.cn
 * @Date: 2025-04-06 18:28:12
 * @LastEditTime: 2025-04-09 01:12:35
 * @FilePath: /flutter_woo_2025/lib/global.dart
 * @Description: 
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'common/index.dart';

class Global {
  static Future<void> init() async {
    // 插件初始化
    WidgetsFlutterBinding.ensureInitialized();

    // 工具类
    await Storage().init();
    Loading();

    // 初始化服务
    Get.put<ConfigService>(ConfigService()); // 全局配置服务
    Get.put<WPHttpService>(WPHttpService()); // 网络请求

    // 初始化配置
    await ConfigService.to.init();

    // 加载服务
    Get.put<UserService>(UserService()); // 用户
  }
}
