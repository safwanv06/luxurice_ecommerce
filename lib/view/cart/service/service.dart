import 'dart:convert';
import 'dart:developer';

import 'package:globsoft_ecommerce_application/main.dart';
import 'package:globsoft_ecommerce_application/utils/flushbar/flushbar.dart';
import 'package:globsoft_ecommerce_application/utils/shared_data/shared_data.dart';
import 'package:globsoft_ecommerce_application/view/cart/service/model/model.dart';
import 'package:globsoft_ecommerce_application/view/home/service/model/model.dart';
import 'package:http/http.dart';
import 'package:location/location.dart';
import 'package:geocoding/geocoding.dart' as geocoding;

class CartService {
  static Future<List<ProductData>?> getCartItems() async {
    try {
      Response response = await get(Uri.parse(apiRoutes.viewCart), headers: {
        "Authorization":
            "Bearer ${await sharedPreferenceModel.get(key: SharedPreferenceKey.token)}"
      });
      print("the rsponse is ${response.body}");
      if (response.statusCode == 200) {
        String trimmedResponse =
            response.body.replaceAll("Connected successfully", "");
        Map decodedResponse = jsonDecode(trimmedResponse);
        List items = decodedResponse["cart"];
        List<ProductData> cartItems = [];
        for (var element in items) {
          cartItems.add(ProductData(
              id: element["product_id"],
              name: element["product_name"],
              description: "",
              price: element["price"],
              image: element["image"],
              quantity: element["quantity"],
              createdDate: element["created_at"] != null
                  ? DateTime.parse(element["created_at"])
                  : null));
        }
        return cartItems;
      } else {
        throw Error();
      }
    } catch (e) {
      print("the eoor is $e");
      rethrow;
    }
  }

  static Future checkoutCart({required LocationModel locationModel}) async {
    try {
      Response response = await post(Uri.parse(apiRoutes.checkout), headers: {
        "Authorization":
            "Bearer ${await sharedPreferenceModel.get(key: SharedPreferenceKey.token)}"
      }, body: {
        "address": locationModel.address,
        "latitude": locationModel.latitude,
        "longitude": locationModel.longitude
      });
      if (response.statusCode == 200) {
        return true;
      } else {
        throw Error();
      }
    } catch (e) {
      rethrow;
    }
  }

  static Future locationServices() async {
    try {
      Location location = Location();
      PermissionStatus permissionStatus = await location.hasPermission();
      if (permissionStatus == PermissionStatus.granted ||
          permissionStatus == PermissionStatus.grantedLimited) {
        LocationData cordinates = await location.getLocation();
        if (cordinates.latitude != null && cordinates.longitude != null) {
          List<geocoding.Placemark> placeMarks =
              await geocoding.placemarkFromCoordinates(
                  cordinates.latitude!, cordinates.longitude!);
          return LocationModel(
              address:
                  "${placeMarks[0].name}, ${placeMarks[0].street}, ${placeMarks[0].country} - ${placeMarks[0].postalCode}",
              latitude: cordinates.latitude!.toString(),
              longitude: cordinates.longitude!.toString());
        } else {
          throw Error();
        }
      } else {
        location.requestPermission();
        throw Error();
      }
    } catch (e) {
      rethrow;
    }
  }
}
