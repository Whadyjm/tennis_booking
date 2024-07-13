import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tenniscourt/appConstantes.dart';
import 'package:tenniscourt/models/canchaModel.dart';
import 'package:tenniscourt/providers/reservaProvider.dart';
import 'package:tenniscourt/screens/authPages/login.dart';
import 'package:tenniscourt/widgets/canchaCard.dart';
import 'package:tenniscourt/widgets/titulo.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {

    final reservasProvider = Provider.of<ReservaProvider>(context);
    final reservas = reservasProvider.reservas;

    List<CanchaModel> canchas = [
      CanchaModel(nombre: 'Epic Box', tipo: 'Tipo A', disponible: true, fecha: '9 de julio de 2024', image: 'assets/epicBox.jpg'),
      CanchaModel(nombre: 'Sport Box', tipo: 'Tipo C', disponible: false, fecha: '10 de julio de 2024', image: 'assets/sportBox.jpg'),
      CanchaModel(nombre: 'Multiple Box', tipo: 'Tipo A', disponible: true, fecha: '10 de julio de 2024', image: 'assets/multipleBox.jpg'),
    ];

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: AppConstants.green,
        automaticallyImplyLeading: false,
        title: Image.asset(
            height: 50,
            'assets/logo.png'),
        actions: [
          const CircleAvatar(
            backgroundImage: NetworkImage('https://img.freepik.com/fotos-premium/mujer-joven-raqueta-tenis-sobre-su-cara-aislada-rostro-neutral-mirada-segura-fotografia-cerca_264277-894.jpg?w=360'),
          ),
          IconButton(onPressed: (){}, icon: const Icon(Icons.notifications_none_rounded, size: 30, color: Colors.white,)),
          IconButton(onPressed: (){
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context){
              return const Login();
            }), (Route route) => false);
          }, icon: const Icon(Icons.menu_rounded, size: 30, color: Colors.white,)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 20.0, left: 20, bottom: 10),
                  child: Text('Hola Andrea!', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                ),
              ],
            ),
            const Divider(thickness: 0.3,),
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 15.0, left: 20, bottom: 10),
                  child: Titulo(titulo: 'Canchas')
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 430,
                width: double.maxFinite,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: canchas.length,
                    itemBuilder: (context, index){
                      return CanchaCard(
                        nombre: canchas[index].nombre,
                        image: canchas[index].image,
                        tipo: canchas[index].tipo,
                        fecha: canchas[index].fecha,
                        disponible: canchas[index].disponible,);
                    }),
              ),
            ),
            const Divider(thickness: 0.3,),
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 15.0, left: 20, bottom: 10),
                  child: Titulo(titulo: 'Reservas programadas')
                ),
              ],
            ),
            SizedBox(
              height: 500,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                itemCount: reservas.length,
                itemBuilder: (context, index) {
                  final reserva = reservas[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
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
                                      CircleAvatar(
                                        radius: 15,
                                        backgroundImage: NetworkImage('https://img.freepik.com/fotos-premium/mujer-joven-raqueta-tenis-sobre-su-cara-aislada-rostro-neutral-mirada-segura-fotografia-cerca_264277-894.jpg?w=360'),
                                      ),
                                      const SizedBox(width: 10,),
                                      Text('Andrea Gómez')
                                    ],
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
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
