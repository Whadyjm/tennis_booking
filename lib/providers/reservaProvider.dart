import 'package:flutter/material.dart';
import 'package:tenniscourt/models/reservaModel.dart';

class ReservaProvider extends ChangeNotifier {
  List<ReservaModel> _reservas = [];
  List<ReservaModel> get reservas => _reservas;

  void addReserva(ReservaModel reserva) {
    _reservas.add(reserva);
    notifyListeners();
  }

  void clearReserva(ReservaModel reserva) {
    _reservas.clear();
    notifyListeners();
  }

  void eliminarReserva(int indice) {
    if (indice >= 0 && indice < _reservas.length) {
      _reservas.removeAt(indice);
      notifyListeners();
    }
  }
}
