import 'package:flutter/material.dart';
import 'package:avaliacao_2/src/features/cores/core/cores.dart';
import 'package:avaliacao_2/src/features/mandar_texto/presentation/pages/mandar_texto_screen.dart';
import 'package:avaliacao_2/src/features/editar_perfil/presentation/pages/editar_perfil_screen.dart';

class TelaInicial extends StatelessWidget {
  const TelaInicial({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Cores.roxo1,
      ),
      child: TabBarView(
        children: [
          MandarTexto(email: email,),
          EditarPerfil()
        ]
      ) 
    );
  }
}