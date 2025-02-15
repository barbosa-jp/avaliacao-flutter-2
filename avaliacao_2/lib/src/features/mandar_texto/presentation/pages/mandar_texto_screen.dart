import 'dart:io';

import 'package:avaliacao_2/src/features/cores/core/cores.dart';
import 'package:avaliacao_2/src/features/mandar_texto/presentation/widgets/botao_audio.dart';
import 'package:flutter/material.dart';
import 'package:avaliacao_2/src/features/mandar_texto/presentation/widgets/botao_enviar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';
import 'package:path/path.dart' as p;

class MandarTexto extends StatefulWidget {
  const MandarTexto({super.key, required this.email});

  final String email;

  @override
  State<MandarTexto> createState() => _MandarTextoState();
}

class _MandarTextoState extends State<MandarTexto> {
  final meuControlador = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final AudioRecorder audioRecorder = AudioRecorder();
  bool _isRecording = false;

  @override
  void dispose() {
    meuControlador.dispose();
    super.dispose();
  }

  void enviar() async {
    try {
      final url = Uri.https(
          'flutter-project-prova-default-rtdb.firebaseio.com', 'textos.json');

      await http.post(url,
          headers: {
            'Content-Type': 'application/json',
          },
          body: json.encode({
            'email': widget.email,
            'texto': meuControlador.text.trim(),
          }));
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Center(
            child: SingleChildScrollView(
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                SizedBox(
                  width: 350,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Form(
                      key: _formKey,
                      child: TextFormField(
                        controller: meuControlador,
                        cursorColor: Cores.branco,
                        style: GoogleFonts.lato(color: Cores.branco),
                        maxLines: 20,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Cores.roxo2,
                          hintText: 'Como foi seu dia?',
                          hintStyle: GoogleFonts.lato(color: Cores.branco50),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
            ),
          ),
          Row(children: [
            BotaoAudio(
                onTap: () async {
                  if (_isRecording) {
                    String? filePath = await audioRecorder.stop();
                    if (filePath != null) {
                      try {
                        final url = Uri.https(
                            'flutter-project-prova-default-rtdb.firebaseio.com', 'textos.json');

                        await http.post(url,
                            headers: {
                              'Content-Type': 'application/json',
                            },
                            body: json.encode({
                              'email': widget.email,
                              'texto': filePath.trim(),
                            }));
                      } catch (error) {
                        print(error);
                      }
                    }
                    setState(() {
                      _isRecording = false;
                    });
                  } else {
                    if (await audioRecorder.hasPermission()) {
                      final Directory appDocumentsDir =
                          await getApplicationDocumentsDirectory();
                      final String filePath =
                          p.join(appDocumentsDir.path, 'recording.wav');
                      await audioRecorder.start(const RecordConfig(),
                          path: filePath);
                      setState(() {
                        _isRecording = true;
                      });
                    }
                  }
                },
                icone: _isRecording ? Icons.stop : Icons.mic),
            BotaoEnviar(onTap: enviar),
          ]),
        ]);
  }
}
