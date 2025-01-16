import 'package:avaliacao_2/src/features/menu/data/list_tiles.dart';
import 'package:avaliacao_2/src/features/menu/presentation/widgets/list_tile_template.dart';
import 'package:avaliacao_2/src/features/menu/presentation/widgets/menu_perfil.dart';
import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(padding: EdgeInsets.zero, children: [
      MenuPerfil(),
      ...listTilesOpcoes.map((opcao) {
        return ListTileTemplate(
          icone: opcao["icone"],
          texto: opcao["texto"],
          screen: opcao["screen"]
        );
      })
    ]);
  }
}
