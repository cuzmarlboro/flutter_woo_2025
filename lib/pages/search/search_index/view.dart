import 'package:ducafe_ui_core/ducafe_ui_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_woo_2025/common/index.dart';
import 'package:get/get.dart';

import 'index.dart';

class SearchIndexPage extends GetView<SearchIndexController> {
  const SearchIndexPage({super.key});

  // 列表项
  Widget _buildListItem(BuildContext context, TagsModel item) {
    return ListTile(
      title: TextWidget.label(item.name ?? ""),
      trailing: IconWidget.icon(
        Icons.north_west,
        color: context.colors.scheme.primary,
      ),
      onTap: () => controller.onListItemTap(item),
    );
  }

  // 列表
  Widget _buildList(BuildContext context) {
    return ListView.separated(
      itemBuilder: (BuildContext context, int index) {
        TagsModel item = controller.tagsList[index];
        return _buildListItem(context, item);
      },
      // 分割组件生成器
      separatorBuilder: (BuildContext context, int index) {
        return const Divider();
      },
      itemCount: controller.tagsList.length,
    );
  }

  // 导航栏
  AppBar _buildAppBar() {
    return AppBar(
      titleSpacing: AppSpace.listItem,
      // 搜索栏
      title: InputWidget(
        controller: controller.searchEditController,
        placeholder: "You can try T-Shirt", //LocaleKeys.commonSearchInput.tr,
        prefix: const IconWidget.icon(Icons.search),
        // onChanged: (val) {
        //   printInfo(info: val);
        // },
      ).paddingRight(AppSpace.page),
    );
  }

  // 主视图
  Widget _buildView(BuildContext context) {
    return _buildList(context);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchIndexController>(
      init: SearchIndexController(),
      id: "search_index",
      builder: (_) {
        return Scaffold(
          // 导航栏
          appBar: _buildAppBar(),

          // 主视图
          body: SafeArea(
            child: _buildView(context),
          ),
        );
      },
    );
  }
}
