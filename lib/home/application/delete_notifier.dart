import 'package:crud/home/infrastructure/home_remote_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
part 'delete_notifier.freezed.dart';

@freezed
class DeleteMusicState with _$DeleteMusicState {
  const factory DeleteMusicState.initial() = _Initial;
  const factory DeleteMusicState.noConnection() = _NoConnection;
  const factory DeleteMusicState.empty() = _Empty;
  const factory DeleteMusicState.loading() = _Loading;
  const factory DeleteMusicState.error() = _Error;
  const factory DeleteMusicState.success(String message) = _Success;
}

class DeleteNotifier extends StateNotifier<DeleteMusicState> {
  final MusicModelRemote _musicRemote;

  DeleteNotifier(this._musicRemote) : super(const DeleteMusicState.initial());

  Future<void> deleteMusic(String id) async {
    state = const DeleteMusicState.loading();
    final result = await _musicRemote.deleteMusic(id);
    state = result.fold(
        (l) => const DeleteMusicState.error(),
        (r) => r.when(
            noConnection: () => const DeleteMusicState.noConnection(),
            result: (message) => DeleteMusicState.success(message)));
  }

  Future<void> deleteProduct(String id) async {
    state = const DeleteMusicState.loading();
    final result = await _musicRemote.deleteProduct(id);
    state = result.fold(
        (l) => const DeleteMusicState.error(),
        (r) => r.when(
            noConnection: () => const DeleteMusicState.noConnection(),
            result: (result) => DeleteMusicState.success(result)));
  }
}
