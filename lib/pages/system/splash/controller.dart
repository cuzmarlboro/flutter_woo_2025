/*
 * @LastEditors: hezeying@xdf.cn
 * @Date: 2025-04-06 16:06:16
 * @LastEditTime: 2025-04-06 16:10:14
 * @FilePath: /flutter_woo_2025/lib/pages/system/splash/controller.dart
 * @Description: 
 */
import 'package:get/get.dart';

class SplashController extends GetxController {
  SplashController();

  String title = "";

  _initData() {
    update(["splash"]);
  }

  void onTap(int ticket) {
    title = "GetBuilder -> 点击了第 $ticket 个按钮";
    // 手动触发 splash_title 更新
    update(['splash_title']);
  }

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
