import 'package:e_comerce/domain/models/Product.dart';

abstract class ProductRepository {
  Future<List<Product>?> getProduct(num skip);
}
