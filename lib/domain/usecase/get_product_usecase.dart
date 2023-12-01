import 'package:e_comerce/domain/models/Product.dart';
import 'package:e_comerce/domain/repository/product_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetProductUseCase {
  ProductRepository repository;

  @factoryMethod
  GetProductUseCase(this.repository);

  Future<List<Product>?> getProduct() {
    return repository.getProduct();
  }
}
