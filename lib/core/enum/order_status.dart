import 'package:json_annotation/json_annotation.dart';

enum OrderStatus {
  @JsonValue('ORDERED')
  ordered,
  @JsonValue('DELIVERED')
  delivered,
  @JsonValue('RETURNED')
  returned,
}
