import 'package:flutter/material.dart';
import 'package:tenniscourt/appConstantes.dart';
import 'package:tenniscourt/screens/authPages/login.dart';

class Registro extends StatefulWidget {
  const Registro({super.key});

  @override
  State<Registro> createState() => LoginState();
}

class LoginState extends State<Registro> {

  bool visible = true;
  var usernameTextController = TextEditingController();
  var phoneTextController = TextEditingController();
  var cityTextController = TextEditingController();
  var emailTextController = TextEditingController();
  var passwordTextController = TextEditingController();
  var confirmPasswordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final screenPage = MediaQuery.sizeOf(context).width > 600;

    return screenPage
        ? Scaffold(
        backgroundColor: AppConstants.darkBlue,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: MaterialButton(
                          onPressed: () {  },
                          child: GestureDetector(
                              onTap: (){
                                Navigator.pop(context);
                              } ,
                              child: Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: AppConstants.green,
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                  child: const Icon(Icons.arrow_back_rounded, color: AppConstants.darkBlue,))
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(50.0),
                    child: Image.asset(
                        height: 150,
                        'assets/agendado_logo.png'),
                  ),
                  //NOMBRE Y APELLIDO
                  SizedBox(
                    width: 600,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                          controller: usernameTextController,
                          //enableSuggestions: !isPasswordType,
                          cursorColor: AppConstants.green,
                          style: const TextStyle(color: AppConstants.green),
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.perm_identity_rounded, color: AppConstants.green,),
                            labelText: 'Nombre y apellido',
                            labelStyle: const TextStyle(color: Colors.grey),
                            filled: true,
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            fillColor: Colors.white.withOpacity(0.3),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(width: 0, style: BorderStyle.none),
                            ),
                          ),
                          validator: (value){
                            if(value!.isEmpty){
                              return "Ingrese su nombre y apellido";
                            }else{
                              null;
                            }
                          }
                      ),
                    ),
                  ),
                  //CORREO ELECTRONICO
                  SizedBox(
                    width: 600,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                          controller: emailTextController,
                          keyboardType: TextInputType.emailAddress,
                          cursorColor: AppConstants.green,
                          style: const TextStyle(color: AppConstants.green),
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.mail_outline_rounded, color: AppConstants.green),
                            labelText: 'Correo eletrónico',
                            labelStyle: const TextStyle(color: Colors.grey),
                            filled: true,
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            fillColor: Colors.white.withOpacity(0.3),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(width: 0, style: BorderStyle.none),
                            ),
                          ),
                          validator: (value){
                            if(value!.isEmpty || !value.contains('@')){
                              return "Ingrese un correo electrónico válido";
                            }else{
                              null;
                            }
                          }
                      ),
                    ),
                  ),
                  //Teléfono
                  SizedBox(
                    width: 600,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                          controller: phoneTextController,
                          keyboardType: TextInputType.number,
                          cursorColor: AppConstants.green,
                          style: const TextStyle(color: AppConstants.green),
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.phone_android_rounded, color: AppConstants.green,),
                            labelText: 'Teléfono',
                            labelStyle: const TextStyle(color: Colors.grey),
                            filled: true,
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            fillColor: Colors.white.withOpacity(0.3),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(width: 0, style: BorderStyle.none),
                            ),
                          ),
                          validator: (value){
                            if(value!.isEmpty){
                              return "Ingrese un número de teléfono";
                            }else{
                              null;
                            }
                          }
                      ),
                    ),
                  ),
                  //CONTRASEÑA
                  SizedBox(
                    width: 600,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                          keyboardType: TextInputType.text,
                          controller: passwordTextController,
                          obscureText: visible,
                          //enableSuggestions: !isPasswordType,
                          cursorColor: AppConstants.green,
                          style: const TextStyle(color: AppConstants.green),
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.lock_outline_rounded, color: AppConstants.green),
                            suffixIcon: IconButton(
                                highlightColor: Colors.transparent,
                                onPressed: (){
                                  setState(() {visible = !visible;});
                                },
                                icon: Icon(visible == true ? Icons.visibility:Icons.visibility_off_rounded), color: Colors.grey),
                            labelText: 'Contraseña',
                            labelStyle: const TextStyle(color: Colors.grey),
                            filled: true,
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            fillColor: Colors.white.withOpacity(0.3),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(width: 0, style: BorderStyle.none),
                            ),
                          ),
                          validator: (value){
                            if(value!.isEmpty){
                              return "Ingrese una contraseña";
                            }else{
                              null;
                            }
                          }
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 600,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                          keyboardType: TextInputType.text,
                          controller: confirmPasswordTextController,
                          obscureText: visible,
                          //enableSuggestions: !isPasswordType,
                          cursorColor: AppConstants.green,
                          style: const TextStyle(color: AppConstants.green),
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.lock_outline_rounded, color: AppConstants.green),
                            suffixIcon: IconButton(
                              highlightColor: Colors.transparent,
                              onPressed: (){
                                setState(() {visible = !visible;});
                              },
                              icon: Icon(visible == true ? Icons.visibility:Icons.visibility_off_rounded), color: Colors.grey,),
                            labelText: 'Confirmar contraseña',
                            labelStyle: const TextStyle(color: Colors.grey),
                            filled: true,
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            fillColor: Colors.white.withOpacity(0.3),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(width: 0, style: BorderStyle.none),
                            ),
                          ),
                          validator: (value){
                            if(value!.isEmpty){
                              return "Ingrese una contraseña";
                            }else{
                              null;
                            }
                          }
                      ),
                    ),
                  ),
                  //REGISTRAR
                  SizedBox(
                    width: 300,
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: MaterialButton(
                          height: 60,
                          minWidth: 350,
                          color: AppConstants.green,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18)
                          ),
                          onPressed: (){},
                          child: const Text('Registrarme', style: TextStyle(color: AppConstants.darkBlue, fontSize: 20, fontWeight: FontWeight.bold),)
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Ya tengo cuenta', style: TextStyle(fontSize: 15, color: Colors.white)),
                      TextButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return Login();
                        }));
                      }, child: const Text('Iniciar sesión', style: TextStyle(fontSize: 17, color: AppConstants.green),))
                    ],
                  )
                ],
              ),
            ),
          ),
        )
    )
        : Scaffold(
        backgroundColor: AppConstants.darkBlue,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MaterialButton(
                        onPressed: () {  },
                        child: GestureDetector(
                            onTap: (){
                              Navigator.pop(context);
                            } ,
                            child: Container(
                              width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: AppConstants.green,
                                  borderRadius: BorderRadius.circular(18),
                                ),
                                child: const Icon(Icons.arrow_back_rounded, color: AppConstants.darkBlue,))
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: Image.asset(
                      height: 150,
                      'assets/agendado_logo.png'),
                ),
                //NOMBRE Y APELLIDO
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                      controller: usernameTextController,
                      //enableSuggestions: !isPasswordType,
                      cursorColor: AppConstants.green,
                      style: const TextStyle(color: AppConstants.green),
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.perm_identity_rounded, color: AppConstants.green,),
                        labelText: 'Nombre y apellido',
                        labelStyle: const TextStyle(color: Colors.grey),
                        filled: true,
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        fillColor: Colors.white.withOpacity(0.3),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(width: 0, style: BorderStyle.none),
                        ),
                      ),
                      validator: (value){
                        if(value!.isEmpty){
                          return "Ingrese su nombre y apellido";
                        }else{
                          null;
                        }
                      }
                  ),
                ),
                //CORREO ELECTRONICO
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                      controller: emailTextController,
                      keyboardType: TextInputType.emailAddress,
                      cursorColor: AppConstants.green,
                      style: const TextStyle(color: AppConstants.green),
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.mail_outline_rounded, color: AppConstants.green),
                        labelText: 'Correo eletrónico',
                        labelStyle: const TextStyle(color: Colors.grey),
                        filled: true,
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        fillColor: Colors.white.withOpacity(0.3),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(width: 0, style: BorderStyle.none),
                        ),
                      ),
                      validator: (value){
                        if(value!.isEmpty || !value.contains('@')){
                          return "Ingrese un correo electrónico válido";
                        }else{
                          null;
                        }
                      }
                  ),
                ),
                //Teléfono
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                      controller: phoneTextController,
                      keyboardType: TextInputType.number,
                      cursorColor: AppConstants.green,
                      style: const TextStyle(color: AppConstants.green),
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.phone_android_rounded, color: AppConstants.green,),
                        labelText: 'Teléfono',
                        labelStyle: const TextStyle(color: Colors.grey),
                        filled: true,
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        fillColor: Colors.white.withOpacity(0.3),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(width: 0, style: BorderStyle.none),
                        ),
                      ),
                      validator: (value){
                        if(value!.isEmpty){
                          return "Ingrese un número de teléfono";
                        }else{
                          null;
                        }
                      }
                  ),
                ),
                //CONTRASEÑA
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                      keyboardType: TextInputType.text,
                      controller: passwordTextController,
                      obscureText: visible,
                      //enableSuggestions: !isPasswordType,
                      cursorColor: AppConstants.green,
                      style: const TextStyle(color: AppConstants.green),
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock_outline_rounded, color: AppConstants.green),
                        suffixIcon: IconButton(
                          highlightColor: Colors.transparent,
                          onPressed: (){
                            setState(() {visible = !visible;});
                          },
                          icon: Icon(visible == true ? Icons.visibility:Icons.visibility_off_rounded), color: Colors.grey),
                        labelText: 'Contraseña',
                        labelStyle: const TextStyle(color: Colors.grey),
                        filled: true,
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        fillColor: Colors.white.withOpacity(0.3),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(width: 0, style: BorderStyle.none),
                        ),
                      ),
                      validator: (value){
                        if(value!.isEmpty){
                          return "Ingrese una contraseña";
                        }else{
                          null;
                        }
                      }
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                      keyboardType: TextInputType.text,
                      controller: passwordTextController,
                      obscureText: visible,
                      //enableSuggestions: !isPasswordType,
                      cursorColor: AppConstants.green,
                      style: const TextStyle(color: AppConstants.green),
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock_outline_rounded, color: AppConstants.green),
                        suffixIcon: IconButton(
                          highlightColor: Colors.transparent,
                          onPressed: (){
                            setState(() {visible = !visible;});
                          },
                          icon: Icon(visible == true ? Icons.visibility:Icons.visibility_off_rounded), color: Colors.grey,),
                        labelText: 'Confirmar contraseña',
                        labelStyle: const TextStyle(color: Colors.grey),
                        filled: true,
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        fillColor: Colors.white.withOpacity(0.3),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(width: 0, style: BorderStyle.none),
                        ),
                      ),
                      validator: (value){
                        if(value!.isEmpty){
                          return "Ingrese una contraseña";
                        }else{
                          null;
                        }
                      }
                  ),
                ),
                //REGISTRAR
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: MaterialButton(
                      height: 60,
                      minWidth: 350,
                      color: AppConstants.green,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18)
                      ),
                      onPressed: (){},
                      child: const Text('Registrarme', style: TextStyle(color: AppConstants.darkBlue, fontSize: 20, fontWeight: FontWeight.bold),)
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Ya tengo cuenta', style: TextStyle(fontSize: 15, color: Colors.white)),
                    TextButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return Login();
                      }));
                    }, child: const Text('Iniciar sesión', style: TextStyle(fontSize: 17, color: AppConstants.green),))
                  ],
                )
              ],
            ),
          ),
        )
    );
  }
}