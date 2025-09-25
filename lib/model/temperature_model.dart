import 'package:wether_app/model/wether_model.dart';

class Temperature {
    final Imperial metric;
    final Imperial imperial;

    Temperature({
        required this.metric,
        required this.imperial,
    });

    factory Temperature.fromJson(Map<String, dynamic> json) => Temperature(
        metric: Imperial.fromJson(json["Metric"]),
        imperial: Imperial.fromJson(json["Imperial"]),
    );

    Map<String, dynamic> toJson() => {
        "Metric": metric.toJson(),
        "Imperial": imperial.toJson(),
    };
}
