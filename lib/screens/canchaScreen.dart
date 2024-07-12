import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tenniscourt/appConstantes.dart';
import 'package:tenniscourt/widgets/titulo.dart';

class CanchaScreen extends StatefulWidget {
  CanchaScreen({super.key, required this.image, required this.nombre, required this.tipo, required this.disponible,});

  final String image;
  final String nombre;
  final String tipo;
  final bool disponible;

  @override
  State<CanchaScreen> createState() => _CanchaScreenState();
}

class _CanchaScreenState extends State<CanchaScreen> {

  late TextEditingController descriptionController = TextEditingController();

  List<String> entrenadorList = [
    'Mark Gonzalez',
    'Luisa Herrera'
  ];

  List<DropdownMenuItem<String>>? get DropDownList {
    List<DropdownMenuItem<String>>? menuItem =
    List<DropdownMenuItem<String>>.generate(
      entrenadorList.length,
          (index) => DropdownMenuItem(
        value: entrenadorList[index],
        child: Text(entrenadorList[index]),
      ),
    );
    return menuItem;
  }

  String? _dropDownValue;

  Future<void> showDate () async {
    _selectedDate = await showDatePicker(
        keyboardType: TextInputType.datetime,
        context: context,
        firstDate: DateTime(1950),
        lastDate: DateTime.now()
    );
    if (_selectedDate != null) {
      setState(() {});
    } else {
      _selectedDate = DateTime.now();
    }
  }

  late DateTime? _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: 400,
                    child: Swiper(
                      curve: Curves.ease,
                      itemBuilder: (BuildContext context, int index) {
                        return Image.asset(fit: BoxFit.cover, widget.image);
                      },
                      itemCount: 3,
                      pagination: const SwiperPagination(
                          builder: SwiperPagination.dots),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
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
                                child: const Icon(Icons.arrow_back_rounded, color: Colors.white,))
                        ),
                      ),
                      IconButton(onPressed: (){}, icon: const Icon(Icons.favorite_border_rounded, color: Colors.white, size: 35,))
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(widget.nombre, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),
                          ],
                        ),
                        const SizedBox(height: 10,),
                        Text('Cancha ${widget.tipo}', style: const TextStyle(fontSize: 15),),
                        const SizedBox(height: 5,),
                        Row(
                          children: [
                            Text(widget.disponible ? 'Disponible':'No disponible', style: const TextStyle(fontSize: 15)),
                            const SizedBox(width: 10,),
                            Container(
                              height: 10,
                              width: 10,
                              decoration: BoxDecoration(
                                  color: widget.disponible ? Colors.blue:Colors.grey,
                                  borderRadius: BorderRadius.circular(50)
                              ),
                            ),
                            const SizedBox(width: 10,),
                            const Icon(Icons.access_time_rounded, size: 15,),
                            const Text('7:00 AM a 4:00 PM'),
                          ],
                        ),
                        const SizedBox(height: 10,),
                        const Row(
                          children: [
                            Icon(Icons.location_pin, size: 18,),
                            const SizedBox(width: 5,),
                            Text('Vía Av. Caracas y Av. P.º Caroní', style: TextStyle(fontSize: 15),),
                          ],
                        ),
                        const SizedBox(height: 20,),
                        SizedBox(
                          height: 50,
                          width: 200,
                          child: DropdownButtonFormField(
                              decoration: InputDecoration(
                                  hintText: "Agregar instructor",
                                  contentPadding: const EdgeInsets.all(15),
                                  hintStyle: const TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.normal),
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.circular(15))),
                              dropdownColor: Colors.white,
                              borderRadius: BorderRadius.circular(25),
                              items: DropDownList,
                              value: _dropDownValue,
                              onChanged: (String? value) {
                                setState(() {
                                  _dropDownValue = value;
                                });
                              }),
                        ),
                      ],
                    ),
                    const Column(
                      children: [
                        Text('\$25', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.blue),),
                        Text('Por hora', style: TextStyle(fontSize: 15, color: Colors.grey),),
                        Row(
                          children: [
                            Icon(Icons.cloudy_snowing, color: Colors.blue,),
                            const SizedBox(width: 10,),
                            Text('30%', style: TextStyle(fontSize: 15, color: Colors.grey),),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 15.0, left: 20, bottom: 10),
                child: Titulo(titulo: 'Establecer fecha y hora')
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: showDate,
                    child: Container(
                      padding: const EdgeInsets.all(12),
                        height: 70,
                        width: 350,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Fecha'),
                            const SizedBox(width: 5,),
                            Text(DateFormat('dd/MM/yy').format(_selectedDate!), style: const TextStyle(fontSize: 18, color: Colors.grey),)
                          ],
                        )
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: showDate,
                      child: Container(
                          padding: const EdgeInsets.all(12),
                          height: 70,
                          width: 170,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Desde'),
                              const SizedBox(width: 5,),
                              Text(DateFormat('dd/MM/yy').format(_selectedDate!), style: const TextStyle(fontSize: 18, color: Colors.grey),)
                            ],
                          )
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: showDate,
                      child: Container(
                          padding: const EdgeInsets.all(12),
                          height: 70,
                          width: 170,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Hasta'),
                              const SizedBox(width: 5,),
                              Text(DateFormat('dd/MM/yy').format(_selectedDate!), style: const TextStyle(fontSize: 18, color: Colors.grey),)
                            ],
                          )
                      ),
                    ),
                  )
                ],
              ),
              const Padding(
                  padding: EdgeInsets.only(top: 15.0, left: 20, bottom: 10),
                  child: Titulo(titulo: 'Agregar un comentario')
              ),
              Center(
                child: SizedBox(
                  width: 350,
                  child: TextFormField(
                      textCapitalization: TextCapitalization.sentences,
                      controller: descriptionController,
                      maxLines: 5,
                      obscureText: false,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(20),
                          hintStyle: const TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.normal),
                          hintText: 'Agregar un comentario...',
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(8))),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Ingresa la descripción de tu artículo.";
                        } else {
                          null;
                        }
                      }),
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
      ),
    );
  }
}
