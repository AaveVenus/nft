import 'package:get/get.dart';
import 'package:nft/app/modules/home/models/nft_model.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () =>  NFTScreen(),
      binding: HomeBinding(),
    ),
  ];
  
  static get controller => null;
}
