import 'package:avaliacao_1/src/features/cores/core/cores.dart';
import 'package:flutter/material.dart';

class Perfil extends StatelessWidget {
  const Perfil({super.key});

  @override
  build(context) {
    return const SizedBox(
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Cores.roxo4,
        ),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Center(
              child: SizedBox(
                height: 90,
                width: 90,
                child: CircleAvatar(
                  backgroundColor: Cores.roxo5,
                  child: Icon(
                    Icons.person_2_sharp, size: 50, color: Cores.branco50
                  ),
                ),
              ),
            ),
            SizedBox(height: 5,),
            Text(
              'João Pedro',
              style: TextStyle(
                color: Cores.branco, 
                fontWeight: FontWeight.bold, 
                fontSize: 25
              ),
            ),
            SizedBox(height: 20,)
          ],
        ),
      )
    );
  }
}
