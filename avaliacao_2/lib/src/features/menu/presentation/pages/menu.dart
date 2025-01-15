import 'package:avaliacao_1/src/features/menu/presentation/widgets/menu_perfil.dart';
import 'package:avaliacao_1/src/features/menu/presentation/widgets/list_tile_perfil.dart';
import 'package:avaliacao_1/src/features/menu/presentation/widgets/list_tile_info.dart';
import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView( 
      padding: EdgeInsets.zero,
      children: const [
        MenuPerfil(),
        ListTilePerfil(),
        ListTileInfo()
      ]
    );
  }
}
