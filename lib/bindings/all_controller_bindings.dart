import 'package:get/get.dart';
import 'package:qtech_jubayer_bin_montasir/controller/product_details_controller.dart';

class AllControllerBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductDetailsController>(() => ProductDetailsController(),
        fenix: true);
  }
}
