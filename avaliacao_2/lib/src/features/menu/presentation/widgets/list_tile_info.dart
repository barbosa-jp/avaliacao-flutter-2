import 'package:avaliacao_2/src/features/navigator/presentation/widgets/navigator.dart';
import 'package:flutter/material.dart';
import 'package:avaliacao_2/src/features/menu/presentation/widgets/menu_opcao.dart';
import 'package:avaliacao_2/src/features/sobre/presentation/pages/sobre_screen.dart';

class ListTileInfo extends StatelessWidget {
  const ListTileInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const MenuOpcao(icone: Icons.info_outline, texto: 'Sobre'),
      onTap: () {
        const Nav(screen: SobreScreen());
      },
    );
  }
}
