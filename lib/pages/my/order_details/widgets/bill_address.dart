/*
 * @LastEditors: hezeying@xdf.cn
 * @Date: 2025-04-12 15:33:10
 * @LastEditTime: 2025-04-12 15:34:36
 * @FilePath: /flutter_woo_2025/lib/pages/my/order_details/widgets/bill_address.dart
 * @Description: 
 */
import 'package:ducafe_ui_core/ducafe_ui_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_woo_2025/common/index.dart';

/// 订单地址项
class BuildBillAddress extends StatelessWidget {
  const BuildBillAddress({
    super.key,
    this.title,
    this.address,
    this.city,
    this.state,
    this.country,
    this.phone,
  });

  final String? title, address, city, state, country, phone;

  Widget _buildView() {
    return <Widget>[
      // title
      TextWidget.label(title ?? "").paddingBottom(AppSpace.listItem),

      // address
      IconWidget.icon(
        Icons.storefront,
        text: address,
      ).paddingBottom(AppSpace.listItem),

      // address, city, state, country
      IconWidget.icon(
        Icons.location_on_outlined,
        text: "$city, $state, $country",
        isExpanded: true,
      ).paddingBottom(AppSpace.listItem),

      // phone
      IconWidget.icon(
        Icons.phone_in_talk,
        text: phone,
      ),
    ].toColumn(
      crossAxisAlignment: CrossAxisAlignment.start,
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildView();
  }
}
