import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:crud/home/domain/music_model.dart';
import 'package:crud/home/shared/music_notifier_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  List<MusicModel> musicList = [];
  @override
  void initState() {
    super.initState();
    getMusic();
  }

  Future<void> getMusic() async {
    Future.microtask(() async {
      log('get music');
      await ref.read(musicNotiferProvider.notifier).getMusic();
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(musicNotiferProvider, (error, result) {
      result.maybeWhen(
          orElse: () {},
          succes: (data) {
            setState(() {
              musicList.addAll(data);
            });
          });
    });
    return Scaffold(
      body: ListView.builder(
          itemCount: musicList.length,
          itemBuilder: (context, index) {
            return Card(
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
                                onPressed: () {},
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                )),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
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
            );
          }),
    );
  }
}
