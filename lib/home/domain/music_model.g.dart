// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MusicModel _$MusicModelFromJson(Map<String, dynamic> json) => MusicModel(
      music_id: json['music_id'] as String,
      music_title: json['music_title'] as String,
      album_name: json['album_name'] as String,
      artist_name: json['artist_name'] as String,
    );

Map<String, dynamic> _$MusicModelToJson(MusicModel instance) =>
    <String, dynamic>{
      'music_id': instance.music_id,
      'music_title': instance.music_title,
      'album_name': instance.album_name,
      'artist_name': instance.artist_name,
    };
