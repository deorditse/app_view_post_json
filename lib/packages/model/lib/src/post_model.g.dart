// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Children _$ChildrenFromJson(Map<String, dynamic> json) => Children(
      kind: json['kind'] as String?,
      data: Post.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ChildrenToJson(Children instance) => <String, dynamic>{
      'kind': instance.kind,
      'data': instance.data.toJson(),
    };

_$_Post _$$_PostFromJson(Map<String, dynamic> json) => _$_Post(
      thumbnail: json['thumbnail'] as String?,
      title: json['title'] as String,
      ups: json['ups'] as int?,
      selftext: json['selftext'] as String?,
    );

Map<String, dynamic> _$$_PostToJson(_$_Post instance) => <String, dynamic>{
      'thumbnail': instance.thumbnail,
      'title': instance.title,
      'ups': instance.ups,
      'selftext': instance.selftext,
    };
