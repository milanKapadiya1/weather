

import 'package:flutter/material.dart';
import 'package:wether_app/api/api_request.dart';
import 'package:wether_app/model/city_model..dart';
import 'package:http/http.dart' as http;
import 'package:wether_app/widget/card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CityModel> topCities = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchTopCity();
  }

  Future<void> fetchTopCity() async {
    setState(() {
      isLoading = true;
    });
    final url = Uri.parse(ApiReques.topcities);
    final reponse = await http.get(url);

    if (reponse.statusCode == 200) {
      topCities = cityModelFromJson(reponse.body);

      // final data = json.decode(reponse.body);

      // List<Country> newList = [];

      // for(var item in data) {
      //   Country converted = Country.fromJson(item);
      //   newList.add(converted);
      // }
      setState(() {
        isLoading = false;
      });
    }
  }

 @override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: const Color.fromARGB(255, 220, 210, 237),
    body: SafeArea(
      child: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: topCities.length,
              itemBuilder: (context, index) {
                return CitynameCard(topcityes: topCities[index]);
              },
            ),
    ),
  );
}

}
