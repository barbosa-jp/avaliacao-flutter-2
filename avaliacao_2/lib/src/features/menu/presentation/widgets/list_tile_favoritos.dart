import 'package:avaliacao_2/src/features/favoritos/presentation/pages/favoritos.dart';
import 'package:flutter/material.dart';
import 'package:avaliacao_2/src/features/menu/presentation/widgets/menu_opcao.dart';

class ListTileFavoritos extends StatelessWidget {
  const ListTileFavoritos({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const MenuOpcao(icone: Icons.star, texto: 'Favoritos'),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return const FavoritosScreen();
            }
          )
        );
      },
    );
  }
}