// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_story.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FoodStory _$FoodStoryFromJson(Map<String, dynamic> json) => FoodStory(
      orderId: json['orderId'] as String,
      branchUUId: json['branchUUId'] as String,
      qrcodeKey: json['qrcodeKey'] as String,
    );

Map<String, dynamic> _$FoodStoryToJson(FoodStory instance) => <String, dynamic>{
      'orderId': instance.orderId,
      'branchUUId': instance.branchUUId,
      'qrcodeKey': instance.qrcodeKey,
    };
