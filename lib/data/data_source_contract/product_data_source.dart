import 'package:e_comerce/domain/models/Product.dart';

abstract class ProductDataSource {
  Future<List<Product>?> getProduct();
}
