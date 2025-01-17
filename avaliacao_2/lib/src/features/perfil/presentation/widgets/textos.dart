import 'package:avaliacao_2/src/features/cores/core/cores.dart';
import 'package:avaliacao_2/src/features/mandar_texto/data/blocos_texto.dart';
import 'package:flutter/material.dart';

class Textos extends StatefulWidget {
  const Textos({super.key});

  @override
  State<Textos> createState() => _TextosState();
}

class _TextosState extends State<Textos> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ...blocosTexto.map((texto) {
        return Column(
          children: [
            SizedBox(
                width: 350,
                child: DecoratedBox(
                    decoration: const BoxDecoration(
                        color: Cores.roxo2,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Center(
                        child: Column(children: [
                      Padding(
                          padding: const EdgeInsets.all(20),
                          child: Text(
                            texto,
                            style: const TextStyle(
                              color: Cores.branco,
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.center,
                          )),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.star_border,
                        ),
                      )
                    ])))),
            const SizedBox(
              height: 20,
            )
          ],
        );
      })
    ]);
  }
}
