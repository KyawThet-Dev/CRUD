import 'package:crud/core/shared/providers.dart';
import 'package:crud/home/application/delete_notifier.dart';
import 'package:crud/home/application/music_notifer.dart';
import 'package:crud/home/application/product_notifier.dart';
import 'package:crud/home/application/save_music_notifier.dart';
import 'package:crud/home/infrastructure/home_remote_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final musicRemoteServiceProvider =
    Provider((ref) => MusicModelRemote(ref.watch(dioProvider)));

final musicNotiferProvider = StateNotifierProvider<MusicNotifer, MusicState>(
    (ref) => MusicNotifer(ref.watch(musicRemoteServiceProvider)));
final deleteMusicNotifierProvider =
    StateNotifierProvider<DeleteNotifier, DeleteMusicState>(
        (ref) => DeleteNotifier(ref.watch(musicRemoteServiceProvider)));
final productNotifierProvider =
    StateNotifierProvider<ProductNotifier, ProductState>(
        (ref) => ProductNotifier(ref.watch(musicRemoteServiceProvider)));
final saveMusicNotifierProvider =
    StateNotifierProvider<SaveMusicNotifier, SaveMusicState>(
        (ref) => SaveMusicNotifier(ref.watch(musicRemoteServiceProvider)));
