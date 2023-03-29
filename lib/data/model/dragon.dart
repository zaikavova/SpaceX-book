import 'package:json_annotation/json_annotation.dart';

part 'dragon.g.dart';

@JsonSerializable()
class DragonDTO {
  DragonDTO(this.name, this.photos);

  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'flickr_images')
  final List<String> photos;

  static const fromJsonFactory = _$DragonDTOFromJson;

  Map<String, dynamic> toJson() => _$DragonDTOToJson(this);
}
