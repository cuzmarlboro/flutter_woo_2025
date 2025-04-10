import 'package:get/get.dart';

import 'names.dart';
import 'observers.dart';

import 'package:flutter_woo_2025/pages/index.dart';

class RoutePages {
  // 历史记录
  static List<String> history = [];

  // 路由监听
  static RouteObservers observer = RouteObservers();

  static List<GetPage> list = [
    GetPage(
      name: RouteNames.cartApplyPromoCode,
      page: () => const ApplyPromoCodePage(),
    ),
    GetPage(
      name: RouteNames.cartBuyDone,
      page: () => const BuyDonePage(),
    ),
    GetPage(
      name: RouteNames.cartBuyNow,
      page: () => const BuyNowPage(),
    ),
    GetPage(
      name: RouteNames.cartCartIndex,
      page: () => const CartIndexPage(),
    ),
    GetPage(
      name: RouteNames.goodsCategory,
      page: () => const CategoryPage(),
    ),
    GetPage(
      name: RouteNames.goodsHome,
      page: () => const HomePage(),
    ),
    GetPage(
      name: RouteNames.goodsProductDetails,
      page: () => const ProductDetailsPage(),
    ),
    GetPage(
      name: RouteNames.goodsProductList,
      page: () => const ProductListPage(),
    ),
    GetPage(
      name: RouteNames.myLanguage,
      page: () => const LanguagePage(),
    ),
    GetPage(
      name: RouteNames.myMyAddress,
      page: () => const MyAddressPage(),
    ),
    GetPage(
      name: RouteNames.myMyIndex,
      page: () => const MyIndexPage(),
    ),
    GetPage(
      name: RouteNames.myOrderDetails,
      page: () => const OrderDetailsPage(),
    ),
    GetPage(
      name: RouteNames.myOrderList,
      page: () => const OrderListPage(),
    ),
    GetPage(
      name: RouteNames.myProfileEdit,
      page: () => const ProfileEditPage(),
    ),
    GetPage(
      name: RouteNames.myTheme,
      page: () => const ThemePage(),
    ),
    GetPage(
      name: RouteNames.searchSearchFilter,
      page: () => const SearchFilterPage(),
    ),
    GetPage(
      name: RouteNames.searchSearchIndex,
      page: () => const SearchIndexPage(),
    ),
    GetPage(
      name: RouteNames.systemLogin,
      page: () => const LoginPage(),
    ),
    GetPage(
      name: RouteNames.systemMain,
      page: () => const MainPage(),
      binding: MainBinding(),
    ),
    GetPage(
      name: RouteNames.systemRegister,
      page: () => const RegisterPage(),
    ),
    GetPage(
      name: RouteNames.systemRegisterPin,
      page: () => const RegisterPinPage(),
    ),
    GetPage(
      name: RouteNames.systemSplash,
      page: () => const SplashPage(),
    ),
    GetPage(
      name: RouteNames.systemUserAgreement,
      page: () => const UserAgreementPage(),
    ),
    GetPage(
      name: RouteNames.systemWelcome,
      page: () => const WelcomePage(),
    ),
    GetPage(
      name: RouteNames.stylesStylesIndex,
      page: () => const StylesIndexPage(),
    ),
    GetPage(
      name: RouteNames.stylesTextIndex,
      page: () => const TextPage(),
    ),
    GetPage(
      name: RouteNames.stylesImageIndex,
      page: () => const ImagePage(),
    ),
    GetPage(
      name: RouteNames.stylesIconIndex,
      page: () => const IconPage(),
    ),
    GetPage(
      name: RouteNames.stylesButtonsIndex,
      page: () => const ButtonsPage(),
    ),
    GetPage(
      name: RouteNames.stylesInputsIndex,
      page: () => const InputsPage(),
    ),
    GetPage(
      name: RouteNames.stylesTextForm,
      page: () => const TextFormPage(),
    ),
    GetPage(
      name: RouteNames.stylesListTile,
      page: () => const ListTilePage(),
    ),
    GetPage(
      name: RouteNames.stylesCheckbox,
      page: () => const CheckboxPage(),
    ),
  ];
}
