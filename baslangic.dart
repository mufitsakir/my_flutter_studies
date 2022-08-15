
import 'package:flutter/material.dart';

void main(){
  String mesaj_mrb ="merhaba..";
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar (
      title: Text(mesaj_mrb) ,
      ),
      body: Center(
        child: Text("Gövde Kısım"),
      ),
    ),
  ));
}