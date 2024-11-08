import 'dart:convert';

import 'package:globsoft_ecommerce_application/view/orders/service/model/model.dart';
import 'package:http/http.dart';

import '../../../main.dart';
import '../../../utils/shared_data/shared_data.dart';
import '../../home/service/model/model.dart';

class OrdersService {
  static Future<List<OrderedItemModel>> getOrders() async {
    print("here");
    try {
      Response response = await get(
          Uri.parse(
              "https://globosoft.co.uk/ecommerce-api/api/orders/list.php"),
          headers: {
            "Authorization":
                "Bearer ${await sharedPreferenceModel.get(key: SharedPreferenceKey.token)}"
          });
      if (response.statusCode == 200) {
        String trimmedResponse =
            response.body.replaceAll("Connected successfully", "");
        Map decodedResponse = jsonDecode(trimmedResponse);
        List items = decodedResponse["orders"];
        List<OrderedItemModel> orders = [];
        for (var element in items) {
          List items = element["items"];
          List<ProductData> orderedProducts = [];
          for (var element2 in items) {
            orderedProducts.add(ProductData(
                id: element2["product_id"],
                name: element2["product_name"],
                description: "",
                quantity: element2["quantity"],
                price: element2["price"]));
          }
          orders.add(OrderedItemModel(
              orderId: element["id"],
              totalAmount: element["total"],
              address: element["address"],
              latitude: element["latitude"],
              longitude: element["longitude"],
              createdAt: DateTime.parse(element["created_at"]),
              orderedProducts: orderedProducts));
        }
        return orders;
      } else {
        throw Error();
      }
    } catch (e) {
      rethrow;
    }
  }
}
