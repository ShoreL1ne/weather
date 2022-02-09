import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather/widgets/weather_icon.dart';

class WeekWeather extends StatefulWidget {
  const WeekWeather({Key? key}) : super(key: key);

  @override
  State<WeekWeather> createState() => _WeekWeatherState();
}

class _WeekWeatherState extends State<WeekWeather> {
  final now = DateTime.now();

  var today = DateTime.now();
  bool isToday = true;
  void addOneDay() {
    setState(() {
      isToday ? isToday = false : today = today.add(const Duration(days: 1));
    });
  }

  final weekInfo = const [
    {'Sky': 'Light Clouds', 'Max': 5, 'Min': 4},
    {'Sky': 'Heavy Clouds', 'Max': 5, 'Min': 4},
    {'Sky': 'Snow', 'Max': 5, 'Min': 4},
    {'Sky': 'Light Rain', 'Max': 5, 'Min': 4},
    {'Sky': 'Heavy Rain', 'Max': 5, 'Min': 4},
    {'Sky': 'Thunder', 'Max': 5, 'Min': 4},
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240,
      width: double.infinity,
      child: Column(
        children: weekInfo.map(
          (day) {
            addOneDay();
            return Container(
              height: 40,
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(width: 2, color: Color(0x40E1EDFC)))),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          DateFormat('d MMMM').format(today).toString(),
                          style: const TextStyle(
                              fontSize: 11, color: Color(0xFF6D6D73)),
                        ),
                        Text(
                            now.day == today.day
                                ? 'Today'
                                : DateFormat('EEEE').format(today).toString(),
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                            )),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            width: 40,
                            alignment: Alignment.center,
                            child: WeatherIcon(day['Sky'] as String)),
                        Container(
                          width: 30,
                          alignment: Alignment.center,
                          child: Text(
                            '${day['Max'].toString()}°',
                          ),
                        ),
                        Container(
                          width: 30,
                          alignment: Alignment.center,
                          child: Text(
                            '${day['Min'].toString()}°',
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}