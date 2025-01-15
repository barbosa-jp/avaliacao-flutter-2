import 'package:flutter/material.dart';
import 'package:avaliacao_1/src/features/menu/presentation/widgets/menu_opcao.dart';
import 'package:avaliacao_1/src/features/perfil/presentation/pages/perfil_screen.dart';

class ListTilePerfil extends StatelessWidget {
  const ListTilePerfil({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const MenuOpcao(icone: Icons.person_2_sharp, texto: 'Perfil'),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return const PerfilScreen();
            }
          )
        );
      },
    );
  }
}