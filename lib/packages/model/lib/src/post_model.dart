import 'package:json_annotation/json_annotation.dart';

part 'post_model.g.dart';
//для запуска кодогенерации в текущем пакете flutter pub run build_runner build --delete-conflicting-outputs

@JsonSerializable(explicitToJson: true)
//explicitToJson - чтобы получать конвертацию в json а не Instance этого класса
class Data {
  final String? after;
  final int? dist;
  String? modhash = '';
  String? geo_filter = '';
  final Children children;

  Data({
    required this.after,
    required this.dist,
    required this.modhash,
    required this.geo_filter,
    required this.children,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Children {
  final String? kind;
  final Post data;

  Children({
    required this.kind,
    required this.data,
  });

  factory Children.fromJson(Map<String, dynamic> json) =>
      _$ChildrenFromJson(json);

  Map<String, dynamic> toJson() => _$ChildrenToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Post {
  final String? thumbnail;
  String title;
  final int? ups;
  final String? selftext;

  Post({
    required this.thumbnail,
    required this.title,
    required this.ups,
    required this.selftext,
  });

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  Map<String, dynamic> toJson() => _$PostToJson(this);
}
