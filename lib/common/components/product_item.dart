import 'package:ducafe_ui_core/ducafe_ui_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../index.dart';

/// 商品展示项
class ProductItemWidget extends StatelessWidget {
  /// 点击事件
  final Function()? onTap;

  /// 商品数据模型
  final ProductModel product;

  /// 图片宽
  final double? imgWidth;

  /// 图片高
  final double? imgHeight;

  const ProductItemWidget(
    this.product, {
    super.key,
    this.onTap,
    this.imgWidth,
    this.imgHeight,
  });

  Widget _buildView(BuildContext context, BoxConstraints constraints) {
    var ws = <Widget>[
      // 图片
      if (product.images?.isNotEmpty == true)
        ImageWidget.img(
          product.images?.first.src ?? "",
          fit: BoxFit.cover, // 图片适应方式
          width: imgWidth ?? constraints.minWidth, // 宽度
          height: imgHeight, // 高度
        ),

      // 描述
      <Widget>[
        // 标题
        TextWidget.label(product.name ?? "", overflow: TextOverflow.ellipsis),

        // 价格
        if (product.price != null)
          TextWidget.label(
            product.price ?? "",
            weight: FontWeight.bold, // 字体粗细
          ),
      ]
          .toColumn(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly, // 主轴 均匀分布
            crossAxisAlignment: CrossAxisAlignment.start, // 交叉轴 开始
          )
          .paddingHorizontal(5)
          .expanded(),
    ];

    return ws
        .toColumn(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // 主轴 两端对齐
          crossAxisAlignment: CrossAxisAlignment.start, // 交叉轴
        )
        .backgroundColor(context.colors.scheme.onPrimary) // 背景色
        .elevation(0.1) // 阴影
        .paddingAll(2) // 内边距
        .onTap(() {
      if (onTap != null) {
        onTap?.call();
      } else {
        Get.toNamed(
          RouteNames.goodsProductDetails,
          arguments: {
            "id": product.id,
          },
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return _buildView(context, constraints);
      },
    );
  }
}
