/*
 * @LastEditors: hezeying@xdf.cn
 * @Date: 2025-04-12 15:40:38
 * @LastEditTime: 2025-04-12 15:40:44
 * @FilePath: /flutter_woo_2025/lib/pages/my/order_details/widgets/total_item.dart
 * @Description: 
 */
import 'package:ducafe_ui_core/ducafe_ui_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_woo_2025/common/index.dart';

/// 小计项
class BuildTotalItem extends StatelessWidget {
  const BuildTotalItem({
    super.key,
    this.title,
    this.price,
    this.currencySymbol,
  });

  /// 标题
  final String? title;

  /// 价格
  final String? price;

  /// 货币符号
  final String? currencySymbol;

  // 主视图
  Widget _buildView() {
    return <Widget>[
      // title
      TextWidget.label(title ?? "").expanded(),

      // price
      TextWidget.muted("$currencySymbol $price"),
    ].toRow();
  }

  @override
  Widget build(BuildContext context) {
    return _buildView();
  }
}
