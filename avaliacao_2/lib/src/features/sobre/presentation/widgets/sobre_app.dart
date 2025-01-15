import 'package:avaliacao_1/src/features/cores/core/cores.dart';
import 'package:flutter/material.dart';

class SobreApp extends StatelessWidget {
  const SobreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min, 
      children: [
        Text(
          'Sobre o aplicativo',
          style: TextStyle(
            color: Cores.branco,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 20,),
        SizedBox(
          width: 350,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Cores.roxo2,
              borderRadius: BorderRadius.all(Radius.circular(20))
            ),
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  'Diário é um aplicativo para ajudar pessoas a organizarem seus pensamentos ou documentar experiências do dia a dia.',
                  style: TextStyle(
                    color: Cores.branco,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,  
                )  
              ),
            )
          )
        ),
      ]
    );
  }
}
