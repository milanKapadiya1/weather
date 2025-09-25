import 'package:flutter/material.dart';
import 'package:wether_app/model/city_model..dart';
import 'package:wether_app/screen/weather_repoart.dart';

class CitynameCard extends StatelessWidget {
  const CitynameCard({super.key, required this.topcityes});

  final CityModel topcityes;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>WeatherRepoart(
        locationKey: topcityes.key,
      ),
      ),
      ),
      child: Card(
        elevation: 2,
        margin: const EdgeInsets.all(10),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(255, 251, 247, 1),
                Color.fromRGBO(242, 216, 216, 1),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Rank : ${topcityes.rank}'),
                      SizedBox(height: 8),
                      Text(
                        topcityes.localizedName,
                        style: TextStyle(
                          fontSize: 19,
                          color: const Color.fromARGB(255, 34, 34, 34),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text('Country : ${topcityes.country.englishName}'),
                      SizedBox(height: 12),
                    ],
                  ),
                ),
                Icon(
                  Icons.wb_sunny, // sun icon
                  color: Colors.yellow.shade700,
                  size: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
