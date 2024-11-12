import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

@RoutePage()
class PlayerPage extends StatefulWidget {
  const PlayerPage({super.key});

  @override
  State<PlayerPage> createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> {
  late VideoPlayerController _playerController;

  @override
  void initState() {
    super.initState();
    _playerController = VideoPlayerController.networkUrl(Uri.parse(
        'https://www.google.com/search?q=short+video+for+flutter&sca_esv=36e605349ca0773c&biw=1536&bih=730&tbm=vid&sxsrf=ADLYWIKgMN8a60icPzbUSunclsDDLMjmOg%3A1731302351396&ei=z5MxZ8zyF9-c4-EP9qnl8Qw&ved=0ahUKEwiMlp3tw9OJAxVfzjgGHfZUOc4Q4dUDCA0&uact=5&oq=short+video+for+flutter&gs_lp=Eg1nd3Mtd2l6LXZpZGVvIhdzaG9ydCB2aWRlbyBmb3IgZmx1dHRlcjIFECEYoAEyBRAhGKABMgUQIRifBTIFECEYnwUyBRAhGJ8FMgUQIRifBTIFECEYnwUyBRAhGJ8FMgUQIRifBTIFECEYnwVI5ugBUM5eWMDmAXAGeACQAQKYAYUCoAHQF6oBBzE5LjExLjG4AQPIAQD4AQGYAhugAuESqAIAwgIMEAAYgAQYQxiKBRgKwgIHEAAYgAQYCsICBhAAGAoYHsICBBAjGCfCAgoQABiABBhDGIoFwgILEAAYgAQYsQMYgwHCAg4QABiABBixAxiDARiKBcICCxAAGIAEGLEDGIoFwgIFEAAYgATCAhAQABiABBixAxhDGIMBGIoFwgIIEAAYgAQYsQPCAgsQABiABBiRAhiKBcICBhAAGBYYHsICCBAAGBYYChgewgIHECEYoAEYCpgDBIgGAZIHBzE0LjEyLjGgB-LJAQ&sclient=gws-wiz-video#'))
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: _playerController.value.aspectRatio,
      child: VideoPlayer(_playerController),
    );
  }
}
