import 'package:get/get.dart';
import 'package:qtech_jubayer_bin_montasir/model/product_details_model.dart';
import 'package:qtech_jubayer_bin_montasir/repository/product_details_repository.dart';

class ProductDetailsController extends GetxController {
  Rx<ProductDetailsModel> getProductData = ProductDetailsModel().obs;
  RxInt sliderImageIndex = 0.obs;
  RxBool productsDataLoading = false.obs;
  RxBool isSelected = false.obs;
  RxBool isVisibleDescription = false.obs;
  RxBool isVisibleAdditional = false.obs;

  @override
  void onInit() {

    productDetails();
    super.onInit();
  }

  void productDetails() async {
try{
  productsDataLoading.value = true;
  ProductDetailsModel? responseData =
  await ProductDetailsRepository().getProductDetails();
  getProductData.value = responseData!;
  productsDataLoading.value = false;
}catch(error){
  Get.snackbar("error", error.toString());
}
  }
}
