import 'package:flutter/material.dart';
import 'package:tenniscourt/screens/weatherScreen.dart';
import 'package:weather/weather.dart';

class Weather extends StatefulWidget {
  const Weather({
    super.key, required this.prob,
  });

  final String prob;

  @override
  State<Weather> createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.cloudy_snowing, color: Colors.blue,),
        const SizedBox(width: 5,),
        MaterialButton(
          onPressed: () {  },
          child: GestureDetector(
              onTap:(){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return const WeatherScreen();
                }));
              },
              child: const Text('Ver clima', style: TextStyle(fontSize: 15, color: Colors.grey),)),
        ),
        //Text(widget.prob, style: const TextStyle(fontSize: 15, color: Colors.grey),),
      ],
    );
  }
}