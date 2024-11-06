// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';
part 'music_model.g.dart';

@JsonSerializable()
class MusicModel {
  final String music_id;
  final String music_title;
  final String album_name;
  final String artist_name;

  MusicModel(
      {required this.music_id,
      required this.music_title,
      required this.album_name,
      required this.artist_name});

  factory MusicModel.formJson(Map<String, dynamic> json) =>
      _$MusicModelFromJson(json);
  Map<String, dynamic> toJson() => _$MusicModelToJson(this);

  @override
  String toString() {
    return 'MusicModel(music_id: $music_id, music_name: $music_title, album_name: $album_name, artist_name: $artist_name)';
  }
}
