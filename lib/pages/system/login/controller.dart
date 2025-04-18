/*
 * @LastEditors: hezeying@xdf.cn
 * @Date: 2025-04-06 01:55:42
 * @LastEditTime: 2025-04-12 14:46:10
 * @FilePath: /flutter_woo_2025/lib/pages/system/login/controller.dart
 * @Description: 
 */
import 'package:flutter/material.dart';
import 'package:flutter_woo_2025/common/index.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  LoginController();

  /// 用户名
  TextEditingController userNameController =
      TextEditingController(text: "ducafecat5");

  /// 密码
  TextEditingController passwordController =
      TextEditingController(text: "123456");

  /// 表单 key
  GlobalKey formKey = GlobalKey<FormState>();

  /// Sign In
  Future<void> onSignIn() async {
    if ((formKey.currentState as FormState).validate()) {
      try {
        Loading.show();

        // aes 加密密码
        var password = EncryptUtil().aesEncode(passwordController.text);

        // api 请求
        UserTokenModel res = await UserApi.login(UserLoginReq(
          username: userNameController.text,
          password: password,
        ));

        // 本地保存 token
        await UserService.to.setToken(res.token!);
        // 获取用户资料
        await UserService.to.getProfile();

        Loading.success();
        Get.back(result: true);
      } finally {
        Loading.dismiss();
      }
    }
  }

  /// Sign Up 注册
  void onSignUp() {
    Get.offNamed(RouteNames.systemRegister);
  }

  // tap
  void handleTap(int index) {
    Get.snackbar(
      "标题",
      "消息",
    );
  }

  /// 在 widget 内存中分配后立即调用。
  @override
  void onInit() {
    super.onInit();
  }

  /// 在 onInit() 之后调用 1 帧。这是进入的理想场所
  @override
  void onReady() {
    super.onReady();
  }

  /// 在 [onDelete] 方法之前调用。
  @override
  void onClose() {
    super.onClose();
    userNameController.dispose();
    passwordController.dispose();
  }

  /// dispose 释放内存
  @override
  void dispose() {
    super.dispose();
  }
}
