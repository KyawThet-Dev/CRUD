import 'package:crud/core/shared/providers.dart';
import 'package:crud/home/application/music_notifer.dart';
import 'package:crud/home/infrastructure/home_remote_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final musicRemoteServiceProvider =
    Provider((ref) => MusicModelRemote(ref.watch(dioProvider)));

final musicNotiferProvider = StateNotifierProvider<MusicNotifer, MusicState>(
    (ref) => MusicNotifer(ref.watch(musicRemoteServiceProvider)));
