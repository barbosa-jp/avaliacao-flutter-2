import 'package:flutter/material.dart';
import 'package:avaliacao_2/src/features/menu/presentation/widgets/menu_opcao.dart';

class Nav extends StatelessWidget {
  const Nav({super.key, required this.screen});

  final Widget screen;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const MenuOpcao(icone: Icons.star, texto: 'Favoritos'),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return screen;
        }));
      },
    );
  }
}
