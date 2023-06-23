import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'food_story.g.dart';

/// {@template food_story}
/// FoodStory description
/// {@endtemplate}
@JsonSerializable()
class FoodStory extends Equatable {
  /// {@macro food_story}
  const FoodStory({
    required this.orderId,
    required this.branchUUId,
    required this.qrcodeKey,
  });

  /// Creates a FoodStory from Json map
  factory FoodStory.fromJson(Map<String, dynamic> data) =>
      _$FoodStoryFromJson(data);

  /// A description for orderId
  final String orderId;

  /// A description for branchUUId
  final String branchUUId;

  /// A description for qrcodeKey
  final String qrcodeKey;

  @override
  List<Object?> get props => [
        orderId,
        branchUUId,
        qrcodeKey,
      ];

  /// Creates a Json map from a FoodStory
  Map<String, dynamic> toJson() => _$FoodStoryToJson(this);
}
