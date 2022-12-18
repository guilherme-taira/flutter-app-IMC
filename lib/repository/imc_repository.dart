import 'package:flutter_application_imc/classes/imc.dart';

class ImcRepository{
  List<Imc> _todosCalculos = [];

  Future<List<Imc>> getAll() async{
    await Future.delayed(Duration(seconds: 1));
    return _todosCalculos;
  }

  Future<void> adicionarLista(Imc calculo) async{
    await Future.delayed(Duration(seconds: 1));
      _todosCalculos.add(calculo);
  }

  
}