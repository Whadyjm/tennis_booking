import 'package:flutter/cupertino.dart';

class CanchaModel {
  late String image;
  late String nombre, tipo;
  late bool disponible;
  late String fecha;

  CanchaModel({
    required this.image,
    required this.nombre,
    required this.tipo,
    required this.disponible,
    required this.fecha,
});
}