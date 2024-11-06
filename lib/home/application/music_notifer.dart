import 'package:crud/core/domain/response_info_error.dart';
import 'package:crud/home/domain/music_model.dart';
import 'package:crud/home/infrastructure/home_remote_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
part 'music_notifer.freezed.dart';

@freezed
class MusicState with _$MusicState {
  const factory MusicState.initial() = _Initial;
  const factory MusicState.loading() = _Loading;
  const factory MusicState.noConnection() = _NoConnection;
  const factory MusicState.empty() = _Empty;
  const factory MusicState.error(ResponseInfoError error) = _Error;
  const factory MusicState.succes(List<MusicModel> music) = _Success;
}

class MusicNotifer extends StateNotifier<MusicState> {
  final MusicModelRemote _musicRemote;
  MusicNotifer(this._musicRemote) : super(const MusicState.initial());

  Future<void> getMusic() async {
    state = const MusicState.loading();
    final result = await _musicRemote.getMusic();
    state = result.fold(
        (l) => const MusicState.loading(),
        (r) => r.when(
            noConnection: () => const MusicState.noConnection(),
            result: (data) => data.isEmpty
                ? const MusicState.empty()
                : MusicState.succes(data)));
  }
}
