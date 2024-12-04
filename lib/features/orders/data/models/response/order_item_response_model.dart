import 'package:equatable/equatable.dart';
import 'package:graph_test/core/index.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order_item_response_model.g.dart';

@JsonSerializable(createToJson: false)
class OrderItemResponseModel extends Equatable {
  OrderItemResponseModel();

  late final String id;
  late final bool isActive;
  late final String price;
  late final String company;
  late final String picture;
  late final String buyer;
  late final OrderStatus status;
  late final String registered;

  factory OrderItemResponseModel.fromJson(Map<String, dynamic> json) => _$OrderItemResponseModelFromJson(json);

  @override
  List<Object?> get props => [id, isActive, price, company, picture, buyer, status, registered];
}
