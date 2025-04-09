/*
 * @LastEditors: hezeying@xdf.cn
 * @Date: 2025-04-09 09:26:04
 * @LastEditTime: 2025-04-09 09:27:31
 * @FilePath: /flutter_woo_2025/lib/common/components/navigation.dart
 * @Description: 导航栏组件
 */
import 'package:ducafe_ui_core/ducafe_ui_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../index.dart';

/// 导航栏数据模型
class NavigationItemModel {
  final String label;
  final String icon;
  final int count;

  NavigationItemModel({
    required this.label,
    required this.icon,
    this.count = 0,
  });
}

/// 导航栏
class BuildNavigation extends StatelessWidget {
  final int currentIndex; // 当前选中的索引
  final List<NavigationItemModel> items; // 导航栏数据
  final Function(int) onTap; // 点击事件

  const BuildNavigation({
    super.key,
    required this.currentIndex,
    required this.items,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    var ws = <Widget>[];
    for (var i = 0; i < items.length; i++) {
      var color = (i == currentIndex)
          ? context.colors.scheme.primary
          : context.colors.scheme.outline;
      var item = items[i];
      ws.add(
        <Widget>[
          // 图标
          IconWidget.svg(
            item.icon,
            size: 24,
            color: color,
            badgeString: item.count > 0 ? item.count.toString() : null,
          ).paddingBottom(2),
          // 文字
          TextWidget.label(
            item.label.tr,
            color: color,
          ),
        ]
            .toColumn(
              mainAxisAlignment: MainAxisAlignment.center, // 居中
              mainAxisSize: MainAxisSize.max, // 最大
            )
            .onTap(() => onTap(i))
            .expanded(),
      );
    }
    return BottomAppBar(
      color: context.colors.scheme.surface, // 背景色
      elevation: 0, // 阴影
      child: ws
          .toRow(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
          )
          .height(kBottomNavigationBarHeight),
    );
  }
}
