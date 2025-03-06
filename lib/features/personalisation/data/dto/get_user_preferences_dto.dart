import 'package:diet_chaiyoo/features/personalisation/data/model/userPreferences_api_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_user_preferences_dto.g.dart';

@JsonSerializable()
class GetUserPreferencesDTO {
  final List<UserPreferencesApiModel> data;

  GetUserPreferencesDTO({
    required this.data,
  });

  Map<String, dynamic> toJson() => _$GetUserPreferencesDTOToJson(this);

  factory GetUserPreferencesDTO.fromJson(Map<String, dynamic> json) {
    return GetUserPreferencesDTO(
      data: (json['preferences'] as List<dynamic>)
          .map((item) => UserPreferencesApiModel.fromJson(item))
          .toList(),
    );
  }
}
