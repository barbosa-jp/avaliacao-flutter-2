import 'package:avaliacao_1/src/features/cores/core/cores.dart';
import 'package:flutter/material.dart';
import 'package:avaliacao_1/src/features/menu/presentation/pages/menu.dart';
import 'package:avaliacao_1/src/features/app_bar/presentation/widgets/appbar_leading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:avaliacao_1/src/features/abas/presentation/widgets/aba.dart';
import 'package:avaliacao_1/src/features/tela_inicial/presentation/pages/tela_inicial_screen.dart';

class Diario extends StatelessWidget {
  const Diario({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController( //controller for TabBar
      length: 2,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            toolbarHeight: 70,
            centerTitle: true,
            backgroundColor: Cores.roxo5,
            leading: const AppBarLeading(),
            title: Text(
              'Diário',
              style: GoogleFonts.lato(
                color: Cores.branco,
                fontSize: 30,
                fontWeight: FontWeight.bold
              ),
            ),
            bottom: const TabBar(
              dividerColor: Cores.tranparente,
              indicatorColor: Cores.branco,
              tabs: [
                Aba(icone: Icons.edit_square),
                Aba(icone: Icons.settings)
              ],
            ),
          ),
          drawer: const Drawer(
            backgroundColor: Cores.roxo3,
            child: Menu()
          ),
          body: const TelaInicial()
        ),
      )
    );
  }
}
