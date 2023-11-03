import 'dart:convert';
import 'package:api_crud/weather_data.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;



Future<List<Weather>> fetchWeatherData() async {
  String jsonString = '''
    [
      {"city": "New York", "temperature": 20, "condition": "Clear", "humidity": 60, "windSpeed": 5.5},
      {"city": "Los Angeles", "temperature": 25, "condition": "Sunny", "humidity": 50, "windSpeed": 6.8},
      {"city": "London", "temperature": 15, "condition": "Partly Cloudy", "humidity": 70, "windSpeed": 4.2},
      {"city": "Tokyo", "temperature": 28, "condition": "Rainy", "humidity": 75, "windSpeed": 8.0},
      {"city": "Sydney", "temperature": 22, "condition": "Cloudy", "humidity": 55, "windSpeed": 7.3}
    ]
  ''';

  List<dynamic> jsonData = json.decode(jsonString);
  List<Weather> weatherList =
      jsonData.map((data) => Weather.fromJson(data)).toList();
  return weatherList;
}

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Weather Information'),
        ),
        body: FutureBuilder(
          future: fetchWeatherData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              List<Weather> weatherDataList = snapshot.data as List<Weather>;
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.separated(
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: weatherDataList.length,
                  itemBuilder: (context, index) {
                    Weather weatherData = weatherDataList[index];
                    return ListTile(
                      title: Text(weatherData.city),
                      subtitle: Text(
                        'Temperature: ${weatherData.temperature}°C'
                        '\nCondition: ${weatherData.condition}'
                        '\nHumidity: ${weatherData.humidity}%'
                        '\nWind Speed: ${weatherData.windSpeed} m/s',
                      ),
                    );
                  },
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
