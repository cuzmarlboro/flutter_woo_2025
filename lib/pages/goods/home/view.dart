/*
 * @LastEditors: hezeying@xdf.cn
 * @Date: 2025-04-06 18:07:47
 * @LastEditTime: 2025-04-09 18:05:59
 * @FilePath: /flutter_woo_2025/lib/pages/goods/home/view.dart
 * @Description: 商品 - 首页
 */
import 'package:ducafe_ui_core/ducafe_ui_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_woo_2025/common/components/refresher.dart';
import 'package:flutter_woo_2025/common/index.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import 'index.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  // 导航栏
  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      // 背景透明
      // backgroundColor: Colors.transparent,
      // 取消阴影
      // elevation: 0,
      // 标题栏左侧间距
      titleSpacing: AppSpace.listItem,
      // 搜索栏
      title: <Widget>[
        // 搜索
        IconWidget.icon(
          Icons.search_outlined,
          text: LocaleKeys.gHomeNewProduct.tr,
          size: 24,
          color: context.colors.scheme.outline,
        ).expanded(),

        // 分割线
        SizedBox(
          width: 1,
          height: 18,
          child: Container(
            color: context.colors.scheme.outline,
          ),
        ).paddingHorizontal(5),

        // 拍照
        IconWidget.icon(
          Icons.camera_alt_outlined,
          size: 24,
          color: context.colors.scheme.outline,
        )
      ]
          .toRow()
          .padding(
            left: 20,
            top: 5,
            right: 10,
            bottom: 5,
          )
          .decorated(
            borderRadius: BorderRadius.circular(AppRadius.input),
            border: Border.all(
              color: context.colors.scheme.outline,
              width: 1,
            ),
          )
          .tight(height: 40.h, width: double.infinity)
          .paddingLeft(10)
          .onTap(controller.onAppBarTap),
      // 右侧的按钮区
      actions: [
        // 图标
        const IconWidget.svg(
          AssetsSvgs.pNotificationsSvg,
          size: 20,
          isDot: true, // 未读消息 小圆点
        )
            .unconstrained() // 去掉约束, appBar 会有个约束下来
            .padding(
              left: AppSpace.listItem,
              right: AppSpace.page,
            ),
      ],
    );
  }

  // 轮播广告
  Widget _buildBanner() {
    return GetBuilder<HomeController>(
            id: "home_banner",
            builder: (_) {
              return CarouselWidget(
                items: controller.bannerItems,
                currentIndex: controller.bannerCurrentIndex,
                onPageChanged: controller.onChangeBanner,
                height: 190.w,
              );
            })
        .clipRRect(all: AppRadius.image) // 圆角
        .sliverToBoxAdapter()
        .sliverPaddingHorizontal(AppSpace.page); // 左右间距
  }

  // 分类导航
  Widget _buildCategories() {
    return <Widget>[
      for (var i = 0; i < controller.categoryItems.length; i++)
        CategoryListItemWidget(
          category: controller.categoryItems[i],
          onTap: (categoryId) => controller.onCategoryTap(categoryId),
        ).paddingRight(AppSpace.listItem)
    ]
        .toListView(
          scrollDirection: Axis.horizontal, // 水平滚动
        )
        .height(90.w) // 高度
        .paddingVertical(AppSpace.listRow) // 上下间距
        .sliverToBoxAdapter() // 转换为 SliverToBoxAdapter
        .sliverPaddingHorizontal(AppSpace.page); // 左右间距
  }

  // 推荐商品
  Widget _buildFlashSell() {
    return <Widget>[
      for (var i = 0; i < controller.flashShellProductList.length; i++)
        ProductItemWidget(
          controller.flashShellProductList[i],
          imgHeight: 117.w,
          imgWidth: 120.w,
        )
            .constrained(
              width: 120.w,
              height: 170.w,
            )
            .paddingRight(AppSpace.listItem)
    ]
        .toListView(
          scrollDirection: Axis.horizontal,
        )
        .height(170.w)
        .paddingBottom(AppSpace.listRow)
        .sliverToBoxAdapter()
        .sliverPaddingHorizontal(AppSpace.page);
  }

  // 新商品
  Widget _buildNewSell() {
    return GetBuilder<HomeController>(
      id: "home_news_sell",
      builder: (_) {
        return SliverGrid(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int position) {
              var product = controller.newProductProductList[position];
              return ProductItemWidget(
                product,
                imgHeight: 170.w,
              );
            },
            childCount: controller.newProductProductList.length,
          ),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: AppSpace.listRow,
            crossAxisSpacing: AppSpace.listItem,
            childAspectRatio: 0.8,
          ),
        )
            .sliverPadding(bottom: AppSpace.page)
            .sliverPaddingHorizontal(AppSpace.page);
      },
    );
  }

  // 主视图
  Widget _buildView() {
    return controller.flashShellProductList.isEmpty ||
            controller.newProductProductList.isEmpty
        ? // 占位图
        const PlaceholdWidget()
        : CustomScrollView(
            slivers: [
              // 轮播广告
              _buildBanner(),

              // 分类导航
              _buildCategories(),

              // 栏位标题
              controller.flashShellProductList.isNotEmpty
                  ? BuildListTitle(
                      title: LocaleKeys.gHomeFlashSell.tr,
                      subTitle: "03. 30. 30",
                      onTap: () => controller.onAllTap(true),
                    )
                      .sliverToBoxAdapter()
                      .sliverPaddingHorizontal(AppSpace.page)
                  : const SliverToBoxAdapter(),
              // 列表
              _buildFlashSell(),

              // 栏位标题
              controller.newProductProductList.isNotEmpty
                  ? BuildListTitle(
                      title: LocaleKeys.gHomeNewProduct.tr,
                      onTap: () => controller.onAllTap(false),
                    )
                      .sliverToBoxAdapter()
                      .sliverPaddingHorizontal(AppSpace.page)
                  : const SliverToBoxAdapter(),
              // 列表
              _buildNewSell(),
            ],
          );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: Get.find<HomeController>(),
      id: "home",
      builder: (_) {
        return Scaffold(
          appBar: _buildAppBar(context),
          body: SmartRefresher(
            controller: controller.refreshController, // 刷新控制器
            enablePullUp: true, // 启用上拉加载
            onRefresh: controller.onRefresh, // 下拉刷新回调
            onLoading: controller.onLoading, // 上拉加载回调
            footer: const SmartRefresherFooterWidget(), // 底部加载更多
            child: _buildView(),
          ),
        );
      },
    );
  }
}
