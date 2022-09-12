import 'package:json_annotation/json_annotation.dart';

@JsonEnum(fieldRename: FieldRename.kebab)
enum PassType {
  @JsonValue(1)
  email(1),
  @JsonValue(2)
  website(2),
  @JsonValue(3)
  app(3),
  @JsonValue(4)
  game(4),
  @JsonValue(5)
  other(5);

  const PassType(this.valueNum);
  final num valueNum;
}