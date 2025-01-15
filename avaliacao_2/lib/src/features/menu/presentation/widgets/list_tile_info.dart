import 'package:flutter/material.dart';
import 'package:avaliacao_1/src/features/menu/presentation/widgets/menu_opcao.dart';
import 'package:avaliacao_1/src/features/sobre/presentation/pages/sobre_screen.dart';

class ListTileInfo extends StatelessWidget {
  const ListTileInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const MenuOpcao(icone: Icons.info_outline, texto: 'Sobre'),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return const SobreScreen();
            }
          )
        );
      },
    );
  }
}
