import 'package:flutter_woo_2025/common/index.dart';
import 'package:flutter_woo_2025/pages/index.dart';
import 'package:get/get.dart';

class BuyNowController extends GetxController {
  BuyNowController({required this.product});

  // 商品详情
  final ProductModel product;

  // 支付方式图标
  List<String> paymentList = [
    AssetsImages.pVisaPng,
    AssetsImages.pCashPng,
    AssetsImages.pMastercardPng,
    AssetsImages.pPaypalPng,
  ];

  // 送货地址
  String shippingAddress = "";

  // 数量
  int quantity = 1;
  // 运费
  double get shipping => 0;

  // 商品合计价格
  double get totalPrice => double.parse(product.price!) * quantity;

  // 优惠券列表
  final List<CouponsModel> lineCoupons = [];

  // 折扣
  double get discount =>
      lineCoupons.fold<double>(0, (double previousValue, CouponsModel element) {
        return previousValue + (double.parse(element.amount ?? "0"));
      });

  // 下单 checkout
  void onCheckout() async {
    // 商品 LineItem
    List<LineItem> lineItems = [
      LineItem(
        productId: product.id,
        quantity: quantity,
      ),
    ];

    print(LineItem(
      productId: product.id,
      quantity: quantity,
    ).toJson());

    // 提交订单
    OrderModel res = await OrderApi.crateOrder(
      lineItem: lineItems,
      lineCoupons: lineCoupons,
    );

    // 交易成功
    if (res.id != null) {
      // 提示
      Loading.success("Order created.");

      // goto 成功界面
      Get.offNamed(RouteNames.cartBuyDone, arguments: res);
    }
  }

  // 显示输入优惠券 568935ab
  void onEnterCouponCode() {
    BottomSheetWidget.show(
      context: Get.context!,
      content: ApplyPromoCodePage(
        onApplyCouponCode: (couponCode) async {
          // 判断优惠券是否存在
          if (couponCode.isEmpty) {
            Loading.error("Voucher code empty.");
            return;
          }
          CouponsModel? coupon = await CouponApi.couponDetail(couponCode);
          if (coupon != null) {
            couponCode = "";
            bool isSuccess = _applyCoupon(coupon);
            if (isSuccess) {
              Loading.success("Coupon applied.");
            } else {
              Loading.error("Coupon is already applied.");
            }
            update(["buy_now"]);
          } else {
            Loading.error("Coupon code is not valid.");
          }
        },
      ),
    );
  }

  // 使用优惠券
  bool _applyCoupon(CouponsModel item) {
    // 是否有重复
    int index = lineCoupons.indexWhere((element) => element.id == item.id);
    if (index >= 0) {
      return false;
    }
    // 添加
    lineCoupons.add(item);
    return true;
  }

  // 修改数量
  void onQuantityChange(int value) {
    if (value <= 0) {
      value = 1;
    }
    quantity = value;
    update(["buy_now"]);
  }

  // goto 送货地址修改
  Future<void> onShippingTap() async {
    var result = await Get.toNamed(RouteNames.myMyAddress,
        arguments: {"type": "Shipping"});

    print("result: $result");
    if (result != null && result == true) {
      shippingAddress = UserService.to.shipping;
      update(["buy_now"]);
    }
  }

  // 初始
  _initData() {
    shippingAddress = UserService.to.shipping;

    update(["buy_now"]);
  }

  void onTap() {}

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
