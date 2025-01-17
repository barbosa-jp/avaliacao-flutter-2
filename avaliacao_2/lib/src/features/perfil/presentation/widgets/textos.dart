import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Textos extends StatefulWidget {
  const Textos({super.key});

  @override
  State<Textos> createState() => _TextosState();
}

class _TextosState extends State<Textos> {

  Future<List> carregarTextos() async{
    final url = Uri.https(
      'flutter-project-prova-default-rtdb.firebaseio.com', 'textos.json'
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> texto = json.decode(response.body);

      List<Map<String, dynamic>> textosInseridos = [];

      texto.forEach((key, value) {
        textosInseridos.add(value);
      });

      return textosInseridos;

    } else {
      throw Exception('Falha ao carregar os dados');
    }
  }

  @override
  Widget build(BuildContext context) {

    return Expanded(
      child: FutureBuilder<List>(
        future: carregarTextos(), 
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Erro: ${snapshot.error}'),
            );
          } else if (snapshot.hasData) {
            final textos = snapshot.data!;
      
            return ListView.builder(
              itemCount: textos.length,
              itemBuilder: (context, index) {
                final textoItem = textos[index];
                return ListTile(
                  title: Text(textoItem['texto'] ?? 'Texto não encontrado'),
                );
              },
            );
          } else {
            return const Center(
              child: Text('Nenhum texto encontrado'),
            );
          }
        }
      ),
    );

  //   return Column(children: [
  //     List textoData = carregarTextos(),
  //     ...blocosTexto.map((texto) {
  //       return Column(
  //         children: [
  //           SizedBox(
  //             width: 350,
  //             child: DecoratedBox(
  //               decoration: const BoxDecoration(
  //                 color: Cores.roxo2,
  //                 borderRadius: BorderRadius.all(Radius.circular(20))
  //               ),
  //               child: Center(
  //                 child: Padding(
  //                   padding: const EdgeInsets.all(20),
  //                   child: Text(
  //                     texto,
  //                     style: const TextStyle(
  //                       color: Cores.branco,
  //                       fontSize: 20,
  //                     ),
  //                     textAlign: TextAlign.center,
  //                   )
  //                 ),
  //               )
  //             )
  //           ),
  //           const SizedBox(
  //             height: 20,
  //           )
  //         ],
  //       );
  //     })
  //   ]);
  // }
}
}