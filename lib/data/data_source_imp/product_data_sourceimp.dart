import 'package:e_comerce/data/api/api_manger.dart';
import 'package:e_comerce/data/data_source_contract/product_data_source.dart';
import 'package:e_comerce/data/models/product_dto.dart';
import 'package:e_comerce/domain/models/Product.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProductDataSource)
class ProductDataSourceImp extends ProductDataSource {
  ApiManger apiManger;

  @factoryMethod
  ProductDataSourceImp(this.apiManger);

  @override
  Future<List<Product>?> getProduct(num skip) async {
    List<ProductDto>? productDto = await apiManger.getProduct(skip);
    List<Product>? products =
        productDto?.map((productDto) => productDto.toProduct()).toList();
    return products;
  }
}
