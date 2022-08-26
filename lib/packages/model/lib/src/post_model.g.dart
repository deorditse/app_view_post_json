// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      after: json['after'] as String?,
      dist: json['dist'] as int?,
      modhash: json['modhash'] as String?,
      geo_filter: json['geo_filter'] as String?,
      children: Children.fromJson(json['children'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'after': instance.after,
      'dist': instance.dist,
      'modhash': instance.modhash,
      'geo_filter': instance.geo_filter,
      'children': instance.children.toJson(),
    };

Children _$ChildrenFromJson(Map<String, dynamic> json) => Children(
      kind: json['kind'] as String?,
      data: Post.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ChildrenToJson(Children instance) => <String, dynamic>{
      'kind': instance.kind,
      'data': instance.data.toJson(),
    };

Post _$PostFromJson(Map<String, dynamic> json) => Post(
      thumbnail: json['thumbnail'] as String?,
      title: json['title'] as String,
      ups: json['ups'] as int?,
      selftext: json['selftext'] as String?,
    );

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      'thumbnail': instance.thumbnail,
      'title': instance.title,
      'ups': instance.ups,
      'selftext': instance.selftext,
    };
