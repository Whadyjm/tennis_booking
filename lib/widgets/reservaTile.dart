import 'package:flutter/material.dart';
import 'package:tenniscourt/models/reservaModel.dart';

class ReservaTile extends StatelessWidget {
  const ReservaTile({
    super.key,
    required this.reserva,
  });

  final ReservaModel reserva;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SizedBox(
        width: 80,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(fit: BoxFit.fill, reserva.image)),
      ),
      title: Text(reserva.nombre, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.calendar_today_outlined, size: 18,),
                      const SizedBox(width: 10,),
                      Text(reserva.fecha),
                    ],
                  ),
                  const Row(
                    children: [
                      Text('Reservado por:'),
                      SizedBox(width: 10,),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 15,
                          backgroundImage: NetworkImage('https://img.freepik.com/fotos-premium/mujer-joven-raqueta-tenis-sobre-su-cara-aislada-rostro-neutral-mirada-segura-fotografia-cerca_264277-894.jpg?w=360'),
                        ),
                        SizedBox(width: 10,),
                        Text('Andrea Gómez')
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(Icons.access_time_outlined, size: 18,),
                      const SizedBox(width: 10,),
                      Text('${reserva.duracion} Hora'),
                      const SizedBox(height: 20,child: VerticalDivider()),
                      Text('\$${int.parse(reserva.duracion)*25}',),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
