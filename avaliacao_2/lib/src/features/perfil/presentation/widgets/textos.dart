import 'package:avaliacao_2/src/features/arquivados/presentation/pages/arquivados.dart';
import 'package:avaliacao_2/src/features/providers/text_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:avaliacao_2/src/features/cores/core/cores.dart';
import 'package:avaliacao_2/src/features/perfil/presentation/widgets/estilo_texto.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Textos extends ConsumerStatefulWidget {
  const Textos({super.key});

  @override
  ConsumerState<Textos> createState() => _TextosState();
}

class _TextosState extends ConsumerState<Textos> {

  Future<List<Texto>> carregarTextos() async {
    final url = Uri.https(
      'flutter-project-prova-default-rtdb.firebaseio.com', 'textos.json'
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);

      List<Texto> textosInseridos = [];

      data.forEach((key, value) {
        value['id'] = key;
        textosInseridos.add(Texto.fromMap(value));
      });

      return textosInseridos;

    } else {
      throw Exception('Falha ao carregar os dados');
    }
  }

  @override
  Widget build(BuildContext context) {
    final arquivados = ref.watch(arquivadosProvider);

    return Expanded(
      child: FutureBuilder<List<Texto>>(
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

                return Container (
                  decoration: BoxDecoration(color: Cores.roxo2),
                  child: ListTile (
                    leading: IconButton(
                      onPressed: () {
                        ref.read(arquivadosProvider.notifier).toggleTexto(textoItem);
                      },
                      icon: Icon(
                        ref.read(arquivadosProvider.notifier).estaArquivado(textoItem)
                         ? Icons.archive 
                         : Icons.archive_outlined,
                      ),
                    ),
                    iconColor: Cores.branco,
                    title: Text(
                      textoItem.texto,
                      style: GoogleFonts.lato(
                        fontSize: 20,
                      ),
                    ),
                    textColor: Cores.branco,
                  ),
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
}
}