import 'package:json_annotation/json_annotation.dart';

part 'cocktail_api_model.g.dart';

@JsonSerializable()
class CocktailApiModel {
  factory CocktailApiModel.fromJson(Map<String, dynamic> json) =>
      _$CocktailApiModelFromJson(json);

  const CocktailApiModel({
    required this.idDrink,
    required this.strDrink,
    this.strImageSource,
  });

  final String idDrink;
  final String strDrink;
  final String? strImageSource;

  Map<String, dynamic> toJson() => _$CocktailApiModelToJson(this);
}
