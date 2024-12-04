// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_item_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderItemResponseModel _$OrderItemResponseModelFromJson(Map<String, dynamic> json) => OrderItemResponseModel()
  ..id = json['id'] as String
  ..isActive = json['isActive'] as bool
  ..price = json['price'] as String
  ..company = json['company'] as String
  ..picture = json['picture'] as String
  ..buyer = json['buyer'] as String
  ..status = $enumDecode(_$OrderStatusEnumMap, json['status'])
  ..registered = json['registered'] as String;

const _$OrderStatusEnumMap = {
  OrderStatus.ordered: 'ORDERED',
  OrderStatus.delivered: 'DELIVERED',
  OrderStatus.returned: 'RETURNED',
};
