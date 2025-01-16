import 'package:avaliacao_2/src/features/navigator/presentation/widgets/navigator.dart';
import 'package:flutter/material.dart';
import 'package:avaliacao_2/src/features/menu/presentation/widgets/menu_opcao.dart';

class ListTileTemplate extends StatelessWidget {
  const ListTileTemplate(
      {super.key,
      required this.icone,
      required this.texto,
      required this.screen});

  final IconData icone;
  final String texto;
  final Widget screen;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: MenuOpcao(icone: icone, texto: texto),
      onTap: () {
        nav(context, screen);
      },
    );
  }
}
