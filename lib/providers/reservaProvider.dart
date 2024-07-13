import 'package:flutter/material.dart';
import 'package:tenniscourt/models/reservaModel.dart';

class ReservaProvider extends ChangeNotifier {
  List<ReservaModel> _reservas = [];

  void addReserva(ReservaModel reserva) {
    _reservas.add(reserva);
    notifyListeners();
  }

  void deleteReserva(ReservaModel reserva) {
    _reservas.clear();
    notifyListeners();
  }

  List<ReservaModel> get reservas => _reservas;
}
