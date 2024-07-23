import 'package:freezed_annotation/freezed_annotation.dart';

part 'news_model.freezed.dart';
part 'news_model.g.dart';

@freezed
class NewsModel with _$NewsModel {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory NewsModel({
    @JsonKey(name: 'author') String? author,
    @JsonKey(name: 'title') String? title,
    @JsonKey(name: 'description') String? description,
    @JsonKey(name: 'url') String? url,
    @JsonKey(name: 'urlToImage') String? urlToImage,
    @JsonKey(name: 'publishedAt') String? publishedAt,
    @JsonKey(name: 'content') String? content,
  }) = _NewsModel;

  factory NewsModel.fromJson(Map<String, dynamic> json) =>
      _$NewsModelFromJson(json);
}