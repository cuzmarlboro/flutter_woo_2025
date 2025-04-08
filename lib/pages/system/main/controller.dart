/*
 * @LastEditors: hezeying@xdf.cn
 * @Date: 2025-04-06 18:03:56
 * @LastEditTime: 2025-04-09 01:28:05
 * @FilePath: /flutter_woo_2025/lib/pages/system/main/controller.dart
 * @Description: 主页 控制器
 */
import 'package:flutter_woo_2025/common/index.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  MainController();

  /// 初始化数据
  _initData() async {
    // 读取用户 profile
    await UserService.to.getProfile();

    print(UserService.to.profile);

    update(["main"]);
  }

  void onTap() {}

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
