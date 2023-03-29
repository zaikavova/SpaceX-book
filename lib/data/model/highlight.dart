import 'package:json_annotation/json_annotation.dart';

part 'highlight.g.dart';

@JsonSerializable()
class HighlightDTO {
  final String title;

  final String details;

  final Map<String, String?> links;

  @JsonKey(name: 'event_date_utc')
  final String DateUtc;

  HighlightDTO(this.title, this.details, this.links, this.DateUtc);

  static const fromJsonFactory = _$HighlightDTOFromJson;

  Map<String, dynamic> toJson() => _$HighlightDTOToJson(this);
}
