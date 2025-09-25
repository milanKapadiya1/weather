// To parse this JSON data, do
//
//     final Weather = WeatherFromJson(jsonString);

import 'dart:convert';

import 'package:wether_app/model/temperature_model.dart';

List<Weather> weatherFromJson(String str) => List<Weather>.from(json.decode(str).map((x) => Weather.fromJson(x)));

String weatherToJson(List<Weather> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Weather {
    final DateTime localObservationDateTime;
    final int epochTime;
    final String weatherText;
    final int weatherIcon;
    final bool hasPrecipitation;
    final dynamic precipitationType;
    final bool isDayTime;
    final Temperature temperature;
    final String mobileLink;
    final String link;

    Weather({
        required this.localObservationDateTime,
        required this.epochTime,
        required this.weatherText,
        required this.weatherIcon,
        required this.hasPrecipitation,
        required this.precipitationType,
        required this.isDayTime,
        required this.temperature,
        required this.mobileLink,
        required this.link,
    });

    factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        localObservationDateTime: DateTime.parse(json["LocalObservationDateTime"]),
        epochTime: json["EpochTime"],
        weatherText: json["WeatherText"],
        weatherIcon: json["WeatherIcon"],
        hasPrecipitation: json["HasPrecipitation"],
        precipitationType: json["PrecipitationType"],
        isDayTime: json["IsDayTime"],
        temperature: Temperature.fromJson(json["Temperature"]),
        mobileLink: json["MobileLink"],
        link: json["Link"],
    );

    Map<String, dynamic> toJson() => {
        "LocalObservationDateTime": localObservationDateTime.toIso8601String(),
        "EpochTime": epochTime,
        "WeatherText": weatherText,
        "WeatherIcon": weatherIcon,
        "HasPrecipitation": hasPrecipitation,
        "PrecipitationType": precipitationType,
        "IsDayTime": isDayTime,
        "Temperature": temperature.toJson(),
        "MobileLink": mobileLink,
        "Link": link,
    };
}



class Imperial {
    final double value;
    final String unit;
    final int unitType;

    Imperial({
        required this.value,
        required this.unit,
        required this.unitType,
    });

    factory Imperial.fromJson(Map<String, dynamic> json) => Imperial(
        value: json["Value"]?.toDouble(),
        unit: json["Unit"],
        unitType: json["UnitType"],
    );

    Map<String, dynamic> toJson() => {
        "Value": value,
        "Unit": unit,
        "UnitType": unitType,
    };
}
