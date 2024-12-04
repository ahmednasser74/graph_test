// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/orders/data/datasource/data_source.dart' as _i717;
import '../../features/orders/data/repositories/orders_repository_imp.dart'
    as _i429;
import '../../features/orders/domain/index.dart' as _i474;
import '../../features/orders/domain/repositories/orders_repository.dart'
    as _i992;
import '../../features/orders/domain/usecase/get_orders_usecase.dart' as _i207;
import '../../features/orders/presentation/cubit/orders_cubit.dart' as _i1028;

// initializes the registration of main-scope dependencies inside of GetIt
_i174.GetIt $initGetIt(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i526.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.factory<_i717.OrdersDataSource>(() => _i717.OrdersDataSourceImpl());
  gh.factory<_i992.OrdersRepository>(
      () => _i429.OrdersRepositoryImp(gh<_i717.OrdersDataSource>()));
  gh.factory<_i207.GetOrdersUsecase>(
      () => _i207.GetOrdersUsecase(gh<_i992.OrdersRepository>()));
  gh.factory<_i1028.OrdersCubit>(
      () => _i1028.OrdersCubit(gh<_i474.GetOrdersUsecase>()));
  return getIt;
}
