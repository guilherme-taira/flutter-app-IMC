import 'dart:ffi';

import 'package:flutter/cupertino.dart';

class Imc {
  String _id = UniqueKey().toString();
  double _peso = 0;
  double _altura = 0;

  Imc(this._peso, this._altura);

  double get peso => _peso;

  void setPeso(peso) {
    _peso = peso;
  }

  double get altura => _altura;

  void setAltura(altura) {
    _altura = altura;
  }

  String get id => _id;

  double getImc() {
    return calculoImcTotal();
  }

  double calculoImcTotal() {
    return peso / altura;
  }

  String getMessage() {
    if (calculoImcTotal() < 16) {
      return "Magro";
    }else if(calculoImcTotal() > 16 && calculoImcTotal() < 17){
      return "Magreza Moderada";
    }else if(calculoImcTotal() > 17 && calculoImcTotal() < 18.5){
      return "Magreza Leve";
    }else if(calculoImcTotal() > 18.5 && calculoImcTotal() < 25){
      return "Saudável";
    }else if(calculoImcTotal() > 25 && calculoImcTotal() < 30){
      return "SobrePeso";
    }else{
      return "GORDO";
    }
  }
}
