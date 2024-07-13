import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tenniscourt/providers/reservaProvider.dart';
import 'package:tenniscourt/screens/bienvenida.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) {
        return ReservaProvider();
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
          useMaterial3: true,
        ),
        home: MyHomePage(),
      ),
    );
  }
}