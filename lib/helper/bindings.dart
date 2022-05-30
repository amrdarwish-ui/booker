import 'package:booker/view/explore_view/explore_view.dart';
import 'package:booker/view_model/account_view_model.dart';
import 'package:booker/view_model/auth_view_model.dart';
import 'package:booker/view_model/search_view_model.dart';
import 'package:booker/view_model/wish_list_view_model.dart';
import 'package:get/get.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => AuthViewModel(),
    );
    Get.lazyPut(() => ExploreView());
    Get.lazyPut(() => SearchViewModel());
    Get.lazyPut(() => AccountViewModel());
    Get.lazyPut(() => WishListViewModel());
  }
}
