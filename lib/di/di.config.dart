// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/api/api_manger.dart' as _i3;
import '../data/data_source_contract/product_data_source.dart' as _i4;
import '../data/data_source_imp/product_data_sourceimp.dart' as _i5;
import '../data/repository/product_repository_imp.dart' as _i7;
import '../domain/repository/product_repository.dart' as _i6;
import '../domain/usecase/get_product_usecase.dart' as _i8;
import '../ui/product_screen/product_view_model.dart' as _i9;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.ApiManger>(_i3.ApiManger());
    gh.factory<_i4.ProductDataSource>(
        () => _i5.ProductDataSourceImp(gh<_i3.ApiManger>()));
    gh.factory<_i6.ProductRepository>(
        () => _i7.ProductRepositoryImp(gh<_i4.ProductDataSource>()));
    gh.factory<_i8.GetProductUseCase>(
        () => _i8.GetProductUseCase(gh<_i6.ProductRepository>()));
    gh.factory<_i9.ProductViewModel>(
        () => _i9.ProductViewModel(gh<_i8.GetProductUseCase>()));
    return this;
  }
}
