/*
 * @LastEditors: hezeying@xdf.cn
 * @Date: 2025-04-06 16:06:16
 * @LastEditTime: 2025-04-09 09:56:06
 * @FilePath: /flutter_woo_2025/lib/pages/system/splash/controller.dart
 * @Description: 
 */
import 'package:flutter_woo_2025/common/index.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  SplashController();

  String title = "";

  /// 跳转页面
  _jumpToPage() {
    // 延迟1秒
    Future.delayed(const Duration(seconds: 1)).then((_) {
      // 是否已打开
      if (ConfigService.to.isAlreadyOpen) {
        // 跳转首页
        Get.offAllNamed(RouteNames.systemMain);
      } else {
        // 跳转欢迎页
        Get.offAllNamed(RouteNames.systemWelcome);
      }
    });
  }

  // _initData() {
  //   update(["splash"]);
  // }

  void onTap(int ticket) {
    title = "GetBuilder -> 点击了第 $ticket 个按钮";
    // 手动触发 splash_title 更新
    update(['splash_title']);
  }

  // @override
  void onInit() {
    super.onInit();
    AppTheme.setSystemStyle();
  }

  @override
  void onReady() {
    super.onReady();
    // _initData();
    _jumpToPage(); // 跳转界面
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
