import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tenniscourt/appConstantes.dart';

class CanchaCard extends StatelessWidget {
  const CanchaCard({super.key, required this.nombre, required this.image, required this.tipo, required this.fecha, required this.disponible});

  final String image;
  final String nombre;
  final String tipo;
  final String fecha;
  final bool disponible;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        clipBehavior: Clip.antiAlias,
        height: 350,
        width: 270,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            SizedBox(
                height: 200,
                width: MediaQuery.of(context).size.width,
                child: Image.asset(fit: BoxFit.cover, image)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(nombre),
                  Text(tipo),
                  Row(
                    children: [
                      const Icon(Icons.calendar_today_rounded, size: 15,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(fecha),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(disponible ? 'Disponible':'No disponible'),
                      const SizedBox(width: 5,),
                      Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                          color: disponible ? Colors.blue:Colors.grey,
                          borderRadius: BorderRadius.circular(50)
                        ),
                      ),
                      const SizedBox(width: 5,),
                      const Icon(Icons.access_time_rounded, size: 15,),
                      Text('7:00 AM a 4:00 PM'),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: MaterialButton(
                  height: 50,
                  minWidth: 350,
                  color: AppConstants.green,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18)
                  ),
                  onPressed: (){},
                  child: const Text('Reservar', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),)
              ),
            ),
          ],
        ),
      ),
    );
  }
}