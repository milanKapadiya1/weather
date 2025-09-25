// To parse this JSON data, do
//
//     final CityModel = CityModelFromJson(jsonString);

import 'dart:convert';

import 'package:wether_app/model/country_model.dart';

List<CityModel> cityModelFromJson(String str) => List<CityModel>.from(json.decode(str).map((x) => CityModel.fromJson(x)));

// String CityModelToJson(List<CityModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CityModel {
    final String key;
    final String type;
    final int rank;
    final String localizedName;
    final String englishName;
    final String primaryPostalCode;
    final Country region;
    final Country country;

    CityModel({
       
        required this.key,
        required this.type,
        required this.rank,
        required this.localizedName,
        required this.englishName,
        required this.primaryPostalCode,
        required this.region,
        required this.country,
    });

    factory CityModel.fromJson(Map<String, dynamic> json) => CityModel(
      
        key: json["Key"],
        type: json["Type"],
        rank: json["Rank"],
        localizedName: json["LocalizedName"],
        englishName: json["EnglishName"],
        primaryPostalCode: json["PrimaryPostalCode"],
        region: Country.fromJson(json["Region"]),
        country: Country.fromJson(json["Country"]),
      
    );

    Map<String, dynamic> toJson() => {
        
        "Key": key,
        "Type": type,
        "Rank": rank,
        "LocalizedName": localizedName,
        "EnglishName": englishName,
        "PrimaryPostalCode": primaryPostalCode,
        "Region": region.toJson(),
        "Country": country.toJson(),
      
    };
}




