import 'dart:developer';

import 'package:crud/core/domain/response_info_error.dart';
import 'package:crud/home/domain/music_model.dart';
import 'package:crud/home/infrastructure/home_remote_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
part 'save_music_notifier.freezed.dart';

@freezed
class SaveMusicState with _$SaveMusicState {
  const factory SaveMusicState.initial() = _Initial;
  const factory SaveMusicState.loading() = _Loading;
  const factory SaveMusicState.empty() = _Empty;
  const factory SaveMusicState.noConnection() = _NoConnection;
  const factory SaveMusicState.error(ResponseInfoError error) = _Error;
  const factory SaveMusicState.success(String message) = _Success;
}

class SaveMusicNotifier extends StateNotifier<SaveMusicState> {
  final MusicModelRemote _musicRemoteService;

  SaveMusicNotifier(this._musicRemoteService)
      : super(const SaveMusicState.initial());

  Future<void> updateMusic(MusicModel music) async {
    log('update music=>${music.toString()}');
    state = const SaveMusicState.loading();
    final result = await _musicRemoteService.updateMusic(music);
    state = result.fold(
        (l) => SaveMusicState.error(l),
        (r) => r.when(
            noConnection: () => const SaveMusicState.noConnection(),
            result: (data) => SaveMusicState.success(data)));
  }
}
