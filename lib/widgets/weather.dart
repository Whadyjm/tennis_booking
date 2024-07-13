import 'package:flutter/material.dart';

class Weather extends StatelessWidget {
  const Weather({
    super.key, required this.prob,
  });

  final String prob;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.cloudy_snowing, color: Colors.blue,),
        SizedBox(width: 5,),
        Text(prob, style: TextStyle(fontSize: 15, color: Colors.grey),),
      ],
    );
  }
}