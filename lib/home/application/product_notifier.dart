import 'package:crud/home/infrastructure/home_remote_service.dart';
import 'package:crud/product/domain/product_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
part 'product_notifier.freezed.dart';

@freezed
class ProductState with _$ProductState {
  const factory ProductState.initial() = _Initial;
  const factory ProductState.loading() = _Loading;
  const factory ProductState.noConnection() = _NoConnection;
  const factory ProductState.empty() = _Empty;
  const factory ProductState.error() = _Error;
  const factory ProductState.success(List<ProductModel> data) = _Success;
}

class ProductNotifier extends StateNotifier<ProductState> {
  final MusicModelRemote _musicRemote;

  ProductNotifier(this._musicRemote) : super(ProductState.initial());

  Future<void> getProducts() async {
    state = const ProductState.loading();
    final result = await _musicRemote.getProducts();
    state = result.fold(
        (l) => const ProductState.loading(),
        (r) => r.when(
            noConnection: () => const ProductState.noConnection(),
            result: (data) => ProductState.success(data)));
  }
}
