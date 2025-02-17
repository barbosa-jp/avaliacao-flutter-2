import 'package:avaliacao_2/src/features/providers/text_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:avaliacao_2/src/features/cores/core/cores.dart';
import 'package:avaliacao_2/src/features/perfil/presentation/widgets/estilo_texto.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:just_audio/just_audio.dart';

class Textos extends ConsumerStatefulWidget {
  const Textos({super.key});

  @override
  ConsumerState<Textos> createState() => _TextosState();
}

class _TextosState extends ConsumerState<Textos> {
  late Future<List<Texto>> _futureTextos;
  List<Texto> textosInseridos = [];
  bool isPlaying = false;
  final AudioPlayer audioPlayer = AudioPlayer();

  Future<List<Texto>> carregarTextos() async {
    final url = Uri.https(
        'flutter-project-prova-default-rtdb.firebaseio.com', 'textos.json');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);

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
  void initState() {
    super.initState();
    _futureTextos = carregarTextos();
  }

  void arquivarItem(int index) {
    setState(() {
      textosInseridos.removeAt(index);
    });
  }

  Future<void> deletarItem(String id) async {
    try {
      final url = Uri.https(
        'flutter-project-prova-default-rtdb.firebaseio.com',
        'textos/$id.json',
      );

      final response = await http.delete(url, headers: {
        'Content-Type': 'application/json',
      });

      if (response.statusCode == 200) {
        print("Item deletado com sucesso");

        setState(() {
          textosInseridos.removeWhere((item) => item.id == id);
        });
      } else {
        print("Erro ao deletar o item");
      }
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(arquivadosProvider);

    return Expanded(
      child: FutureBuilder<List<Texto>>(
          future: _futureTextos,
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
              textosInseridos = snapshot.data!;

            return ListView.builder(
              itemCount: textosInseridos.length,
              itemBuilder: (context, index) {
                final textoItem = textosInseridos[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10,),
                  child: Container(
                    decoration: BoxDecoration(color: Cores.roxo2),
                      child: ListTile(
                        leading: IconButton(
                          onPressed: () {
                            ref
                              .read(arquivadosProvider.notifier)
                              .toggleTexto(textoItem);
                              if (ref
                                .read(arquivadosProvider.notifier)
                                .estaArquivado(textoItem)) {
                                  arquivarItem(index);
                                }
                          },
                          icon: Icon(
                            ref
                              .read(arquivadosProvider.notifier)
                              .estaArquivado(textoItem)
                                ? Icons.archive
                                : Icons.archive_outlined,
                          ),
                        ),
                        iconColor: Cores.branco,
                        textColor: Cores.branco,
                        title: textoItem.tipo == 'texto'
                        ? 
                        Text(
                          textoItem.texto,
                          style: GoogleFonts.lato(
                            fontSize: 20,
                          ),
                        )
                        : MaterialButton(
                          onPressed: () async {
                            if (audioPlayer.playing) {
                              audioPlayer.stop();
                              setState(() {
                                isPlaying = false;
                              });
                            } else {
                              await audioPlayer.setFilePath(textoItem.texto);
                              audioPlayer.play();
                              setState(() {
                                isPlaying = true;
                              });
                            }
                          },
                          child: Text(isPlaying ? 'Está tocando' : 'Tocar áudio', style: TextStyle(color: Cores.branco),),
                         ),
                        trailing: IconButton(
                          onPressed: () => deletarItem(textoItem.id), 
                          icon: Icon(Icons.delete_forever_rounded),
                        ),
                      ),
                    )
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
