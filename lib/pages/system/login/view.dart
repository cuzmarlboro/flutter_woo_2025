/*
 * @LastEditors: hezeying@xdf.cn
 * @Date: 2025-04-06 01:55:42
 * @LastEditTime: 2025-04-06 16:11:33
 * @FilePath: /flutter_woo_2025/lib/pages/system/login/view.dart
 * @Description: 
 */
import 'package:flutter/material.dart';
import 'package:flutter_woo_2025/common/routers/index.dart';
import 'package:get/get.dart';

import 'index.dart';
import 'widgets/widgets.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  // 主视图
  Widget _buildView() {
    return Center(
      child: Column(
        children: [
          const HelloWidget(),
          ElevatedButton(
            onPressed: () {
              controller.onTap(DateTime.now().microsecondsSinceEpoch);
            },
            child: const Text("点击"),
          ),
          // 跳转
          ElevatedButton(
            onPressed: () {
              Get.toNamed(RouteNames.systemSplash);
            },
            child: const Text("跳转 splash"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("login")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
