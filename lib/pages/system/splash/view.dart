/*
 * @LastEditors: hezeying@xdf.cn
 * @Date: 2025-04-06 16:06:16
 * @LastEditTime: 2025-04-06 18:37:58
 * @FilePath: /flutter_woo_2025/lib/pages/system/splash/view.dart
 * @Description: 
 */
import 'package:flutter/material.dart';
import 'package:flutter_woo_2025/common/index.dart';
import 'package:get/get.dart';

import 'index.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({super.key});

  // 主视图
  Widget _buildView() {
    return Center(
      child: Text("SplashPage - ${ConfigService.to.version}"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      init: SplashController(),
      id: "splash",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("splash")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
