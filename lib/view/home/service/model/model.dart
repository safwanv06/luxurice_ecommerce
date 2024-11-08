class ProductData {
  ProductData(
      {
        required this.id,
        required this.name,
      required this.description,
      required this.price,
      this.image,
      this.quantity,
       this.createdDate});

  int id;
  String name;
  String description;
  String price;
  String? image;
  int? quantity;
  DateTime? createdDate;
}
