import 'dart:convert';
import 'package:http/http.dart';
import '../../../main.dart';
import '../../../utils/shared_data/shared_data.dart';
import 'model/model.dart';

class HomeService {
  Future<List<ProductData>> getHomeScreenData() async {
    try {
      Response response = await get(Uri.parse(apiRoutes.products), headers: {
        "Authorization":
            await sharedPreferenceModel.get(key: SharedPreferenceKey.token)
      });
      if (response.statusCode == 200) {
        String data = response.body.replaceAll("Connected successfully", "");
        Map data1 = jsonDecode(data);
        List productData = data1["products"];
        List<ProductData> products = [];
        for (var element in productData) {
          products.add(ProductData(
              id: element["id"],
              name: element["name"],
              description: element["description"],
              price: element["price"],
              image: element["image"],
              createdDate: element["created_at"] != null
                  ? DateTime.parse(element["created_at"])
                  : null));
        }
        return products;
      } else {
        throw Error();
      }
    } catch (e) {
      rethrow;
    }
  }
}
