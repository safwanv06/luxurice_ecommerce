import '../../../home/service/model/model.dart';

class OrderedItemModel {
  OrderedItemModel({
    required this.orderId,
    required this.totalAmount,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.createdAt,
    required this.orderedProducts,
  });

  int orderId;
  String totalAmount;
  String address;
  String latitude;
  String longitude;
  DateTime createdAt;
  List<ProductData> orderedProducts;
}
