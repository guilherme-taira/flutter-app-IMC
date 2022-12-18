import 'package:flutter/material.dart';
import 'package:flutter_application_imc/classes/imc.dart';
import 'package:flutter_application_imc/repository/imc_repository.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var PesoController = TextEditingController();
  var AlturaController = TextEditingController();
  var imcRepository = ImcRepository();
  var _tarefas = const <Imc>[];

  Future<void> obterImcs() async {
    _tarefas = await imcRepository.getAll();
  }

  @override
  void initState() {
    obterImcs();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculadora IMC"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          PesoController.text = "";
          AlturaController.text = "";
          showDialog(
            context: context,
            builder: (BuildContext bc) {
              return AlertDialog(
                title: const Text("Novo Calculo IMC"),
                content: Wrap(
                  children: [
                    const Text("Peso "),
                    TextField(
                      controller: PesoController,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    const Text("Altura "),
                    TextField(
                      controller: AlturaController,
                    ),
                  ],
                ),
                actions: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("Cancelar"),
                      ),
                      TextButton(
                        onPressed: () async {
                          await imcRepository.adicionarLista(Imc(
                              double.parse(PesoController.text),
                              double.parse(AlturaController.text)));

                          Navigator.pop(context);

                          setState(() {});
                        },
                        child: const Text("Salvar"),
                      ),
                    ],
                  ),
                ],
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
          itemCount: _tarefas.length,
          itemBuilder: (BuildContext bc, int index) {
            var calculoImc = _tarefas[index];
            return Column(
              children: [
                Card(
                  child: ListTile(
                    leading: FlutterLogo(),
                    title: Text(calculoImc.getImc().toString()),
                    subtitle: Text(calculoImc.getMessage()),
                  ),
                ),
              ],
            );
          }),
    );
  }
}
