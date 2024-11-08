import 'dart:convert';

import 'package:globsoft_ecommerce_application/main.dart';
import 'package:globsoft_ecommerce_application/utils/shared_data/shared_data.dart';
import 'package:globsoft_ecommerce_application/view/home/service/model/model.dart';
import 'package:http/http.dart';

class ProductViewService {
  static Future<ProductData> getProductDetails({required int id}) async {
    try {
      Response response = await get(
          Uri.parse(apiRoutes.getProductDetails + id.toString()),
          headers: {
            "Authorization":
                await sharedPreferenceModel.get(key: SharedPreferenceKey.token)
          });
      if (response.statusCode == 200) {
        String data = response.body.replaceAll("Connected successfully", "");
        Map data1 = jsonDecode(data);
        Map productDetails = data1["product"];
        return ProductData(
            id: productDetails["id"],
            name: productDetails["name"],
            description: productDetails["description"],
            price: productDetails["price"],
            image: productDetails["image"],
            createdDate: productDetails["created_at"] != null
                ? DateTime.parse(productDetails["created_at"])
                : null);
      } else {
        throw Error();
      }
    } catch (e) {
      rethrow;
    }
  }

  static Future addToCart(
      {required String productId, required String quantity}) async {
    try {
      Response response = await post(Uri.parse(apiRoutes.addToCart), headers: {
        "Authorization":
            "Bearer ${await sharedPreferenceModel.get(key: SharedPreferenceKey.token)}"
      },body: {
        "product_id":productId,
        "quantity":quantity
      });
      if(response.statusCode==200){
        return true;
      }
      else{
        throw Error();
      }
    } catch (e) {
      rethrow;
    }
  }
}
