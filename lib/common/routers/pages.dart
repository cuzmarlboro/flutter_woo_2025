/*
 * @LastEditors: hezeying@xdf.cn
 * @Date: 2025-04-06 00:24:00
 * @LastEditTime: 2025-04-06 02:42:41
 * @FilePath: /flutter_woo_2025/lib/common/routers/pages.dart
 * @Description: 
 */
import 'package:get/get.dart';

import 'names.dart';

import 'package:flutter_woo_2025/pages/index.dart';

class RoutePages {
  static List<GetPage> list = [
    GetPage(
      name: RouteNames.systemLogin,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),
  ];
}
