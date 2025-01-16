import 'package:avaliacao_2/src/features/favoritos/presentation/pages/favoritos.dart';
import 'package:avaliacao_2/src/features/sobre/presentation/pages/sobre_screen.dart';
import 'package:flutter/material.dart';
import 'package:avaliacao_2/src/features/perfil/presentation/pages/perfil_screen.dart';

const List<Map> listTilesOpcoes = [
  {
    'icone': Icons.person_2_sharp,
    'texto': 'Perfil',
    'screen': PerfilScreen()
  },
    {
    'icone': Icons.star,
    'texto': 'Favoritos',
    'screen': FavoritosScreen()
  },
    {
    'icone': Icons.info_outline,
    'texto': 'Sobre',
    'screen': SobreScreen()
  },
];
