/*
 * @LastEditors: hezeying@xdf.cn
 * @Date: 2025-04-10 18:11:22
 * @LastEditTime: 2025-04-10 18:11:32
 * @FilePath: /flutter_woo_2025/lib/pages/styles/checkbox/controller.dart
 * @Description: 
 */
import 'package:get/get.dart';

class CheckboxController extends GetxController {
  CheckboxController();

  bool checked = false;

  void onChanged(bool? checked) {
    this.checked = checked!;
    update(["checkbox"]);
  }

  _initData() {
    update(["checkbox"]);
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
