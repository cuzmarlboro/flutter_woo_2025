import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter_woo_2025/common/index.dart';
import 'package:get/get.dart';

class WelcomeController extends GetxController {
  WelcomeController();

  /// 欢迎数据
  List<WelcomeModel>? items;

  /// 当前位置
  int currentIndex = 0;

  /// 是否显示 Start
  bool isShowStart = false;

  /// slider 控制器
  CarouselSliderController carouselController = CarouselSliderController();

  _initData() {
    items = [
      WelcomeModel(
        image: AssetsImages.welcome_1Png,
        title: LocaleKeys.welcomeOneTitle.tr,
        desc: LocaleKeys.welcomeOneDesc.tr,
      ),
      WelcomeModel(
        image: AssetsImages.welcome_2Png,
        title: LocaleKeys.welcomeTwoTitle.tr,
        desc: LocaleKeys.welcomeTwoDesc.tr,
      ),
      WelcomeModel(
        image: AssetsImages.welcome_3Png,
        title: LocaleKeys.welcomeThreeTitle.tr,
        desc: LocaleKeys.welcomeThreeDesc.tr,
      ),
    ];

    update(["slider"]);
  }

  void onTap() {}

  /// 去首页
  void onToMain() {
    /// 跳转首页, 并关闭所有页面
    Get.offAllNamed(RouteNames.systemMain);
  }

  /// 下一个
  void onNext() {
    carouselController.nextPage();
  }

  /// 当前位置发生改变
  void onPageChanged(int index) {
    print("onPageChanged: $index");
    currentIndex = index;
    isShowStart = currentIndex == 2;
    update(['slider', 'bar']);
  }

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  @override
  void onReady() {
    super.onReady();

    // 设置已打开
    ConfigService().setAlreadyOpen();

    _initData();
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
