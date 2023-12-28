import 'package:freezed_annotation/freezed_annotation.dart';

part 'tag_entity.freezed.dart';
part 'tag_entity.g.dart';

@freezed

/// Tags from Radio browser API
class Tag with _$Tag {
  /// Tags from Radio browser API
  factory Tag({
    required String name,
    required int stationcount,
  }) = _Tag;

  /// Transform JSON in Tag objects
  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);
}
