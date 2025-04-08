/*
 * @LastEditors: hezeying@xdf.cn
 * @Date: 2025-04-08 17:08:12
 * @LastEditTime: 2025-04-08 17:22:34
 * @FilePath: /flutter_woo_2025/lib/common/components/pin.dart
 * @Description: pin 输入框
 */
import 'package:ducafe_ui_core/ducafe_ui_core.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class PinPutWidget extends StatelessWidget {
  /// 提交事件
  final Function(String)? onSubmit;

  /// 焦点
  final FocusNode? focusNode;

  /// 文本编辑控制器
  final TextEditingController? controller;

  /// 验证函数 (整体意思是定义了一个名为 validator 的属性，这个属性是一个可选的函数，这个函数接受一个可为空的 String 参数，并返回一个可为空的 String)
  final String? Function(String?)? validator;

  const PinPutWidget({
    super.key,
    this.onSubmit,
    this.focusNode,
    this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    // 默认
    final defaultPinTheme = PinTheme(
      width: 45,
      height: 45,
      textStyle: const TextStyle(
        fontSize: 18,
        // color: AppColors.surfaceVariant,
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: context.colors.scheme.outlineVariant),
        borderRadius: BorderRadius.circular(5),
      ),
    );
    // 编辑
    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: context.colors.scheme.primary),
      borderRadius: BorderRadius.circular(5),
    );

    // 完成
    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: context.colors.scheme.surfaceContainerLow,
      ),
    );

    return Pinput(
      defaultPinTheme: defaultPinTheme, // 默认样式
      focusedPinTheme: focusedPinTheme, // 聚焦样式
      submittedPinTheme: submittedPinTheme, // 完成样式
      length: 6, // 长度
      validator: validator, // 验证函数
      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
      showCursor: true, // 显示光标
      autofocus: true, // 自动焦点
      obscureText: true, // 密码显示
      keyboardAppearance: Brightness.light,
      focusNode: focusNode, // 焦点
      controller: controller, // 本文控制器
      onCompleted: onSubmit, // 提交
    );
  }
}
