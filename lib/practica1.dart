import 'dart:io';

import 'package:flutter/material.dart';

class Practica1 extends StatefulWidget {
  const Practica1({Key? key}) : super(key: key);

  @override
  State<Practica1> createState() => _Practica1State();
}

class _Practica1State extends State<Practica1> {
  final base = TextEditingController();
  final altura = TextEditingController();
  List tipo = ["Rectangulo", "Triangulo"];
  String t = "";
  //double area = 0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora de figuras geométricas", style: TextStyle(color: Colors.white),),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){
            showDialog(context: context,
                builder: (BuildContext context){
                  return AlertDialog(
                    title: Text("Información"),
                    content: Text("\n Nombre: Sebastián Jazael Medina Rodríguez \n \n No. control: 19400618 \n \n Carrera: ISC",
                      style: TextStyle(fontSize: 15, fontFamily: AutofillHints.addressCity), textAlign: TextAlign.center,),
                    actions: [
                      TextButton(onPressed: (){
                        Navigator.of(context).pop(); //QUITA el alertDialog
                      }, child: Text("OK"))
                    ],
                  ); //AlertDialog
                } );
          }, icon: Icon(Icons.info), color: Colors.white,)
        ],
      ),

      body: Column(

      children: [
        SizedBox(height: 50,),
        Text("Área de un figura geométrica", style: TextStyle(color: Colors.lightGreen, fontSize: 30),),

        SizedBox(height: 30,),
        Padding(padding: EdgeInsets.all(20),
          child: TextField(controller: base,
            decoration:
          InputDecoration(labelText: "Base de la figura", border: UnderlineInputBorder(), icon: Icon(Icons.android_outlined, color: Colors.lightGreen)),
          )
        ),

        SizedBox(height: 15,),
        Padding(padding: EdgeInsets.all(20),
            child: TextField(controller: altura,
              decoration:
              InputDecoration(labelText: "Altura de la figura", border: UnderlineInputBorder(), icon: Icon(Icons.android_outlined, color: Colors.lightGreen,)),
            )
        ),

        SizedBox(height: 25),
        Padding(padding: EdgeInsets.all(20), child:
        DropdownButtonFormField(
          value: "Rectangulo",
          items: tipo.map(
                  (name)=> DropdownMenuItem(child: Text(name), value: name)
          ).toList(),onChanged: (value){
            t=value.toString();
            },
          icon: const Icon(Icons.arrow_drop_down_circle, color: Colors.lightGreen,),
          decoration:
          InputDecoration(labelText: "Ingresa el tipo de figura", prefixIcon: Icon(Icons.search, color: Colors.lightGreen),
          border: OutlineInputBorder()
          ),
        )
        ),

        SizedBox(height: 35),
        SizedBox(height: 30, width: 150, child: ElevatedButton(onPressed: (){
          area(base.text, altura.text, t);
        }, child: Text("Calcular área", style: TextStyle(fontSize: 25, color: Colors.white), textAlign: TextAlign.center,),
        )
        ),

      ],
      ),
    );
  }

  area(String text, String text2, String t) {
    double n1 = double.parse(text);
    double n2 = double.parse(text2);
    double resultado = 0;
    String tipo = "";

    if (t=="Rectangulo"){resultado = n1*n2; tipo = "rectangulo";}
    else if(t=="Triangulo") {resultado = (n1*n2)/2; tipo = "triangulo";}
    else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("No has ingresa el tipo de figura")),
      );
      exitCode;
    }

    showDialog(context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text("Resultado"),
            content: Text("El área del ${tipo} es: ${resultado}"),
            actions: [
              TextButton(onPressed: (){
                Navigator.of(context).pop(); //QUITA el alertDialog
              }, child: Text("OK"))
            ],
          ); //AlertDialog
        } ); //showDialog
  } //area
}

