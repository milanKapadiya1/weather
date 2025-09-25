import 'package:flutter/material.dart';
import 'package:wether_app/api/api_request.dart';
import 'package:wether_app/model/wether_model.dart';
import 'package:http/http.dart' as http;

class WeatherRepoart extends StatefulWidget {
  const WeatherRepoart({
    super.key,
    required this.locationKey,
  });

  final String locationKey;

  @override
  State<WeatherRepoart> createState() => _WeatherRepoartState();
}

class _WeatherRepoartState extends State<WeatherRepoart> {
  Weather? cityWeather;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    fatchWeather(locationKey: widget.locationKey);
  }

  Future<void> fatchWeather({required String locationKey}) async {
    setState(() { 
      isLoading = true;
    });

    final url = Uri.parse('${ApiReques.weather}$locationKey?apikey=lgtCmhKgnKPe9PAVSurhwn19AM4F0GIo');
    final reponse = await http.get(url);

    if (reponse.statusCode == 200) {
      final weatherList = weatherFromJson(reponse.body);
      cityWeather = weatherList.first;
    }

    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
         Card(
  elevation: 2,
  margin: EdgeInsets.all(10),
  child: Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Time of report: ${cityWeather?.localObservationDateTime}'),
        SizedBox(height: 8),
        Text('Weather Text : ${cityWeather?.weatherText}'),
        SizedBox(height: 8),
        Text('Current temperatue : ${cityWeather?.temperature.metric.value}'),
      ],
    ),
  ),
),

          
        ],
      )),
    );
  }
}
