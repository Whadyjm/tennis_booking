import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tenniscourt/appConstantes.dart';
import 'package:tenniscourt/providers/reservaProvider.dart';
import 'package:tenniscourt/rootScreen.dart';
import 'package:tenniscourt/screens/Home.dart';
import 'package:tenniscourt/widgets/titulo.dart';

class Resumen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final reservasProvider = Provider.of<ReservaProvider>(context);
    final reservas = reservasProvider.reservas;

    return SafeArea(
      child: Scaffold(
        body: ListView.builder(
          reverse: true,
          itemCount: reservas.length,
          itemBuilder: (context, index) {
            final reserva = reservas[index];
            return ListTile(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(fit: BoxFit.contain, reserva.image),
                  const Titulo(titulo: 'Resumen'),
                ],
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(reserva.nombre, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.sports_tennis_outlined, size: 18,),
                              const SizedBox(width: 10,),
                              Text('Cancha ${reserva.tipo}'),
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(Icons.person, size: 18,),
                              const SizedBox(width: 10,),
                              Text('Instructor: ${reserva.trainer}'),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(width: 20,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.calendar_today_outlined, size: 18,),
                              const SizedBox(width: 10,),
                              Text('${reserva.fecha}'),
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(Icons.access_time_outlined, size: 18,),
                              const SizedBox(width: 10,),
                              Text('${reserva.duracion} Hora'),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  reserva.comentario.isNotEmpty
                      ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Comentario: ${reserva.comentario}'),
                      )
                      : const SizedBox.shrink(),
                  const SizedBox(height: 50,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Titulo(titulo: 'Total a pagar'),
                      Column(
                        children: [
                          Text('\$${int.parse(reserva.duracion)*25}', style: const TextStyle(color: Colors.blue, fontSize: 25, fontWeight: FontWeight.bold),),
                          Text('Por ${reserva.duracion} Hora', style: const TextStyle(color: Colors.grey))
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 50,),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: MaterialButton(
                        height: 50,
                        minWidth: 350,
                        color: Colors.blue,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                        ),
                        onPressed: (){
                          reservasProvider.deleteReserva(reserva);
                          Navigator.pop(context);
                        },
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.calendar_today_outlined, color: Colors.white, size: 18,),
                            SizedBox(width: 10,),
                            Text('Reprogramar reserva', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.normal),),
                          ],
                        )
                    ),
                  ),
                  MaterialButton(
                      height: 70,
                      minWidth: 350,
                      color: AppConstants.green,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18)
                      ),
                      onPressed: (){
                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context){
                          return const RootScreen();
                        }), (Route route) => false);
                      },
                      child: const Text('Pagar', style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),)
                  ),
                  const SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MaterialButton(
                        height: 70,
                        minWidth: 350,
                        color: Colors.grey.shade400,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18)
                        ),
                        onPressed: (){
                          reservasProvider.deleteReserva(reserva);
                          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context){
                            return Home();
                          }), (Route route) => false);
                        },
                        child: const Text('Cancelar', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),)
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
