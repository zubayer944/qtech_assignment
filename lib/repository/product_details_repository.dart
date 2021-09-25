import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:qtech_jubayer_bin_montasir/api.url/api.url.dart';
import 'package:qtech_jubayer_bin_montasir/model/product_details_model.dart';

class ProductDetailsRepository {
  Future<ProductDetailsModel?> getProductDetails() async {
    try {
      ProductDetailsModel productDetailsModel;
      Uri url = Uri.parse(ApiUrls.productDetailsUrl);
      final http.Response response = await http.get(url);
      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 202) {
        var jsonMap = jsonDecode(response.body);
        productDetailsModel = ProductDetailsModel.fromJson(jsonMap);
        return productDetailsModel;
      }
      else {
        print(
            'ProductDetailsRepository.getProductDetails api called failed with statusCode ${response.statusCode}');
        return null;
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
