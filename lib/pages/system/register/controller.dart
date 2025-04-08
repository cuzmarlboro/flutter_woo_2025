/*
 * @LastEditors: hezeying@xdf.cn
 * @Date: 2025-04-06 18:07:12
 * @LastEditTime: 2025-04-08 23:51:54
 * @FilePath: /flutter_woo_2025/lib/pages/system/register/controller.dart
 * @Description: 注册页面 控制器
 */
import 'package:flutter/material.dart';
import 'package:flutter_woo_2025/common/index.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  RegisterController();

  // 表单key
  GlobalKey formKey = GlobalKey<FormState>();

  // 用户名
  TextEditingController userNameController =
      TextEditingController(text: "hezeying");

  // 邮件
  TextEditingController emailController =
      TextEditingController(text: "ducafecat66666666@gmail.com");

  // 姓
  TextEditingController firstNameController =
      TextEditingController(text: "ducafe");

  // 名
  TextEditingController lastNameController = TextEditingController(text: "何泽颖");

  // 密码
  TextEditingController passwordController =
      TextEditingController(text: "12345678");

  _initData() {
    update(["register"]);
  }

  // 登录
  void onSignIn() {
    Get.offNamed(RouteNames.systemLogin);
  }

  // 注册
  void onSignUp() {
    if ((formKey.currentState as FormState).validate()) {
      // aes 加密密码
      var password = EncryptUtil().aesEncode(passwordController.text);
      // var password = passwordController.text;

      // 验证通过
      Get.offNamed(
        RouteNames.systemRegisterPin,
        arguments: UserRegisterReq(
          username: userNameController.text,
          email: emailController.text,
          firstName: firstNameController.text,
          lastName: lastNameController.text,
          password: password,
        ),
      );
    }
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

  @override
  void onClose() {
    super.onClose();
    userNameController.dispose(); // 释放用户名控制器
    emailController.dispose(); // 释放邮件控制器
    firstNameController.dispose(); // 释放姓控制器
    lastNameController.dispose(); // 释放名控制器
    passwordController.dispose(); // 释放密码控制器
  }
}
