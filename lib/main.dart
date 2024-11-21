import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tenniscourt/providers/reservaProvider.dart';
import 'package:tenniscourt/screens/bienvenida.dart';
import 'package:tenniscourt/webView/WebPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {

    final screenPage = MediaQuery.sizeOf(context).width > 600;

    return ChangeNotifierProvider(
      create: (_) {
        return ReservaProvider();
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
          useMaterial3: true,
        ),
        home: screenPage
            ? const WebPage()
            : const MyHomePage(),
      ),
    );
  }
}