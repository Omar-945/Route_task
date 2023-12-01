import 'package:e_comerce/domain/models/Product.dart';
import 'package:e_comerce/domain/usecase/get_product_usecase.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductViewModel extends Cubit<ProductState> {
  List<Product>? products;
  ScrollController productControler = ScrollController();
  GetProductUseCase productUseCase;
  num skip = 0;

  @factoryMethod
  ProductViewModel(this.productUseCase) : super(Loading());

  void getProduct() async {
    emit(Loading());
    products = await productUseCase.getProduct();
    emit(Success(products));
  }

  void setProductController() {
    productControler.addListener(() {
      if (productControler.position.atEdge) {
        bool isTop;
        if (productControler.position.pixels == 0) {
          isTop = true;
        }
      }
    });
  }
}

sealed class ProductState {}

class Loading extends ProductState {}

class Error extends ProductState {
  String error;

  Error(this.error);
}

class Success extends ProductState {
  List<Product>? products;

  Success(this.products);
}
