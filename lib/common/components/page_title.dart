/*
 * @LastEditors: hezeying@xdf.cn
 * @Date: 2025-04-08 16:07:18
 * @LastEditTime: 2025-04-08 16:07:27
 * @FilePath: /flutter_woo_2025/lib/common/components/page_title.dart
 * @Description: 页面标题 组件
 */
import 'package:ducafe_ui_core/ducafe_ui_core.dart';
import 'package:flutter/material.dart';

import '../index.dart';

class PageTitleWidget extends StatelessWidget {
  /// 标题
  final String title;

  /// 说明
  final String desc;

  const PageTitleWidget({
    super.key,
    required this.title,
    required this.desc,
  });

  @override
  Widget build(BuildContext context) {
    return <Widget>[
      TextWidget.h2(title),
      TextWidget.label(desc),
    ]
        .toColumn(
          crossAxisAlignment: CrossAxisAlignment.start,
        )
        .padding(
          left: 10,
          top: 10,
          bottom: 30,
        );
  }
}
