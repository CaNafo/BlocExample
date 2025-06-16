import 'package:json_annotation/json_annotation.dart';

import 'cocktail_api_model.dart';

part 'cocktails_list_api_model.g.dart';

@JsonSerializable()
class CocktailsListApiModel {
  factory CocktailsListApiModel.fromJson(Map<String, dynamic> json) =>
      _$CocktailsListApiModelFromJson(json);

  const CocktailsListApiModel({this.drinks});

  final List<CocktailApiModel>? drinks;

  Map<String, dynamic> toJson() => _$CocktailsListApiModelToJson(this);
}
