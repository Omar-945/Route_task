import 'dart:convert';

import 'package:e_comerce/data/models/ProductResponse.dart';
import 'package:e_comerce/data/models/product_dto.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

@singleton
@injectable
class ApiManger {
  Future<List<ProductDto>?> getProduct() async {
    try {
      Uri url = Uri.https('dummyjson.com', 'products');
      http.Response responseProducts = await http.get(url);
      var json = jsonDecode(responseProducts.body);
      return ProductResponse.fromJson(json).products;
    } catch (e) {
      print(e.toString());
    }
  }
}
