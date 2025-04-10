/*
 * @LastEditors: hezeying@xdf.cn
 * @Date: 2025-04-10 12:11:30
 * @LastEditTime: 2025-04-10 12:11:34
 * @FilePath: /flutter_woo_2025/lib/pages/my/my_index/widgets/bar_item.dart
 * @Description: 
 */
import 'package:flutter/material.dart';
import 'package:ducafe_ui_core/ducafe_ui_core.dart';
import 'package:flutter_woo_2025/common/index.dart';

class BarItemWidget extends StatelessWidget {
  final String title;
  final String svgPath;

  const BarItemWidget({
    super.key,
    required this.title,
    required this.svgPath,
  });

  @override
  Widget build(BuildContext context) {
    return <Widget>[
      // 图标
      IconWidget.svg(
        svgPath,
        size: 24.sp,
        color: context.colors.scheme.primary,
      ).paddingBottom(AppSpace.iconTextSmail),

      // 标题
      TextWidget.label(
        title,
      ),
    ].toColumn();
  }
}
