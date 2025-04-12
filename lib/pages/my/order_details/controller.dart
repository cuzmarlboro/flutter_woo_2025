/*
 * @LastEditors: hezeying@xdf.cn
 * @Date: 2025-04-06 18:09:29
 * @LastEditTime: 2025-04-12 15:21:17
 * @FilePath: /flutter_woo_2025/lib/pages/my/order_details/controller.dart
 * @Description: 
 */
import 'package:flutter_woo_2025/common/index.dart';
import 'package:get/get.dart';

class OrderDetailsController extends GetxController {
  OrderDetailsController();

  // 订单详情
  final OrderModel order = Get.arguments as OrderModel;

  _initData() {
    update(["order_details"]);
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
