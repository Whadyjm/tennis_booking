import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tenniscourt/appConstantes.dart';
import 'package:tenniscourt/providers/reservaProvider.dart';
import 'package:tenniscourt/rootScreen.dart';
import 'package:tenniscourt/screens/authPages/login.dart';
import 'package:tenniscourt/widgets/reservaTile.dart';
import 'package:tenniscourt/widgets/titulo.dart';

class Reservas extends StatelessWidget {
  const Reservas({super.key});

  @override
  Widget build(BuildContext context) {

    final reservasProvider = Provider.of<ReservaProvider>(context);
    final reservas = reservasProvider.reservas;

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
      body: reservas.isEmpty
          ? Column(
        mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.all(15.0),
                child: Icon(Icons.sports_tennis_rounded, size: 100, color: AppConstants.green,),
              ),
              const Titulo(titulo: 'Aun no has reservado'),
              const Text('¡Conoce nuestros nuevos planes!', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: MaterialButton(
                    height: 70,
                    minWidth: 320,
                    color: AppConstants.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return RootScreen();
                      }));
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.calendar_today_outlined, color: Colors.white, size: 25,),
                        SizedBox(width: 10,),
                        Text('Programar reserva', style: TextStyle(color: Colors.white, fontSize: 21, fontWeight: FontWeight.bold),),
                      ],
                    )
                ),
              ),
            ],
          )
          : SingleChildScrollView(
            child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: MaterialButton(
                  height: 70,
                  minWidth: 320,
                  color: AppConstants.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return const RootScreen();
                    }));
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.calendar_today_outlined, color: Colors.white, size: 25,),
                      SizedBox(width: 10,),
                      Text('Programar reserva', style: TextStyle(color: Colors.white, fontSize: 21, fontWeight: FontWeight.bold),),
                    ],
                  )
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 18.0, top: 12),
              child: Titulo(titulo: 'Mis reservas'),
            ),
            const Divider(),
            Center(
              child: SizedBox(
                height: 500,
                width: 350,
                child: ListView.builder(
                  reverse: false,
                  itemCount: reservas.length,
                  itemBuilder: (context, index) {
                    final reserva = reservas[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          height: 200,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade300,
                                spreadRadius: 2,
                                blurRadius: 5
                              )
                            ]
                          ),
                          child: ReservaTile(reserva: reserva)),
                    );
                  },
                ),
              ),
            ),
                    ],
                  ),
          ),
    );
  }
}
