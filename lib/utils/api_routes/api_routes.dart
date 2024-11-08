String baseUrl = "https://globosoft.co.uk/ecommerce-api/api";

class ApiRoutes {
  String signUp = "$baseUrl/auth/register.php";
  String signIn = "$baseUrl/auth/login.php";
  String products = "$baseUrl/products/list.php";
  String getProductDetails = "$baseUrl/products/details.php?id=";
  String addToCart = "$baseUrl/cart/add.php";
  String viewCart = "$baseUrl/cart/view.php";
  String checkout = "$baseUrl/checkout/checkout.php";
  String orders = "$baseUrl/api/orders/list.php";
}
