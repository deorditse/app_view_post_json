// import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_model.g.dart';

part 'post_model.freezed.dart';
//для запуска кодогенерации в текущем пакете flutter pub run build_runner build --delete-conflicting-outputs

@JsonSerializable(explicitToJson: true)
//explicitToJson - чтобы получать конвертацию в json а не Instance этого класса
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

@freezed
//реализация c использванием пакета freezed чтобы не переопределять операторы вручную, чтобы класы сравнивались не по ссылкам, а по значениям
class Post with _$Post {
  factory Post({
    required String? thumbnail,
    required String title,
    required int? ups,
    required String? selftext,
  }) = _Post;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
}

// @JsonSerializable(explicitToJson: true)
// //explicitToJson - чтобы получать конвертацию в json а не Instance этого класса
// class Post {
//   final String? thumbnail;
//   String title;
//   final int? ups;
//   final String? selftext;
//
//   Post({
//     required this.thumbnail,
//     required this.title,
//     required this.ups,
//     required this.selftext,
//   });
//
//   factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
//
//   Map<String, dynamic> toJson() => _$PostToJson(this);
//
//   @override
//   bool operator ==(Object other) {
//     if (identical(this, other)) {
//       return true;
//     }
//     if (other.runtimeType != runtimeType) {
//       return false;
//     }
//     return other is Post &&
//         other.runtimeType == runtimeType &&
//         other.thumbnail == thumbnail &&
//         other.title == title &&
//         other.ups == ups &&
//         other.selftext == selftext;
//   }
// }
