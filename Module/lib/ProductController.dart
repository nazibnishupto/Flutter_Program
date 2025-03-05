import 'dart:convert';

import 'package:assignment/Models/product.dart';
import 'package:assignment/utils/urls.dart';
import 'package:http/http.dart' as http;

class productController {
  List products = [];

  Future<void> fetchProduct() async {
    final response = await http.get(Uri.parse(Urls.readProduct));
    if (response.statusCode == 200) {
      final prodData = jsonDecode(response.body);
      products = prodData['data'];
    }
  }

  Future<void> createProduct(
      String name, String img, int qty, int price, int totalPrice) async {
    final response = await http.post(
      Uri.parse(Urls.createProduct),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        "ProductName": name,
        "ProductCode": DateTime.now().microsecondsSinceEpoch,
        "Img": img,
        "Qty": qty,
        "UnitPrice": price,
        "TotalPrice": totalPrice
      }),
    );
    if (response.statusCode == 201) {
      fetchProduct();
    }
  }
}
