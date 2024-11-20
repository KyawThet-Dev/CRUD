import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:crud/home/domain/music_model.dart';
import 'package:crud/home/shared/music_notifier_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
    GlobalKey<RefreshIndicatorState>();

@RoutePage()
class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  List<MusicModel> musicList = [];
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final albumController = TextEditingController();
  final artistController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getMusic();
  }

  Future<void> getMusic() async {
    Future.microtask(() async {
      await ref.read(musicNotiferProvider.notifier).getMusic();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(musicNotiferProvider);
    ref.listen(deleteMusicNotifierProvider, (pre, next) {
      next.maybeWhen(
          orElse: () {},
          loading: () => const Center(child: CircularProgressIndicator()),
          success: (data) {
            ref.read(musicNotiferProvider.notifier).getMusic();
          });
    });
    ref.listen(musicNotiferProvider, (error, result) {
      result.maybeWhen(
          orElse: () {},
          loading: () => const Center(child: CircularProgressIndicator()),
          succes: (data) {
            musicList = data;
            log('music length${musicList.length}');
          });
    });
    ref.listen(saveMusicNotifierProvider, (pre, next) {
      next.maybeWhen(
          orElse: () {},
          success: (success) {
            Navigator.of(context).pop();
            ref.read(musicNotiferProvider.notifier).getMusic();
          });
    });
    return Scaffold(
        body: state.maybeWhen(
      orElse: () {},
      loading: () => const Center(child: CircularProgressIndicator()),
      succes: (data) => RefreshIndicator(
        key: _refreshIndicatorKey,
        onRefresh: () => getMusic(),
        child: ListView.builder(
            itemCount: musicList.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {},
                child: Card(
                  color: Colors.white,
                  shadowColor: Colors.blueAccent,
                  child: ListTile(
                    leading: CircleAvatar(
                        backgroundColor: Colors.blueAccent,
                        child: Text('${index + 1}')),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(musicList[index].music_title),
                            Text(musicList[index].album_name),
                            Text(musicList[index].artist_name)
                          ],
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                IconButton(
                                    onPressed: () async {
                                      log('onTap');
                                      await ref
                                          .read(deleteMusicNotifierProvider
                                              .notifier)
                                          .deleteMusic(
                                              musicList[index].music_id);
                                      setState(() {
                                        musicList.removeAt(index);
                                      });
                                    },
                                    icon: const Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    )),
                                IconButton(
                                    onPressed: () =>
                                        _showDialog(context, musicList[index]),
                                    icon: const Icon(
                                      Icons.edit,
                                      color: Colors.green,
                                    )),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    ));
  }

  _showDialog(ctx, MusicModel music) {
    nameController.text = music.music_title;
    albumController.text = music.artist_name;
    artistController.text = music.artist_name;

    return showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              content: Form(
                key: formKey,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Column(
                    children: [
                      const Center(child: Text('Are you sure to create?')),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: nameController,
                        decoration: InputDecoration(
                            hintText: 'Enter your name',
                            enabledBorder: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                borderSide:
                                    BorderSide(color: Colors.grey.shade300)),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey.shade300),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10)))),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please type something';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: albumController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please type something';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            hintText: 'Enter your phone',
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey.shade300),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10))),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey.shade300),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10)))),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: artistController,
                        decoration: InputDecoration(
                            hintText: 'Enter your name',
                            enabledBorder: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                borderSide:
                                    BorderSide(color: Colors.grey.shade300)),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey.shade300),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10)))),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please type something';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(ctx).pop();
                    },
                    child: const Text('Cancel')),
                TextButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        MusicModel musicUpload = MusicModel(
                            music_id: music.music_id,
                            music_title: nameController.text,
                            album_name: albumController.text,
                            artist_name: artistController.text);
                        ref
                            .read(saveMusicNotifierProvider.notifier)
                            .updateMusic(musicUpload);
                        //log(musicUpload.toString());
                      }
                    },
                    child: const Text('Submit'))
              ],
            ));
  }
}
