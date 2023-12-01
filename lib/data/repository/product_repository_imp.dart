import 'package:e_comerce/data/data_source_contract/product_data_source.dart';
import 'package:e_comerce/domain/models/Product.dart';
import 'package:e_comerce/domain/repository/product_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProductRepository)
class ProductRepositoryImp extends ProductRepository {
  ProductDataSource source;

  @factoryMethod
  ProductRepositoryImp(this.source);

  @override
  Future<List<Product>?> getProduct() {
    return source.getProduct();
  }
}
