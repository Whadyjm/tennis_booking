import 'package:flutter/material.dart';
import 'package:tenniscourt/appConstantes.dart';
import 'package:tenniscourt/screens/authPages/login.dart';
import 'package:tenniscourt/screens/authPages/registro.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: Stack(
        children: [
          Image.asset(
              opacity: const AlwaysStoppedAnimation(.40),
              'assets/player.png'),
          Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 200,),
                  Image.asset(
                      height: 150,
                      'assets/logo.png'),
                  const SizedBox(height: 200,),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: MaterialButton(
                        height: 60,
                        minWidth: 350,
                        color: AppConstants.green,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18)
                        ),
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return Login();
                          }));
                        },
                        child: const Text('Iniciar sesión', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),)
                    ),
                  ),
                  MaterialButton(
                      height: 60,
                      minWidth: 350,
                      color: Colors.white24,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18)
                      ),
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return const Registro();
                        }));
                      },
                      child: const Text('Registrarme', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),)
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
