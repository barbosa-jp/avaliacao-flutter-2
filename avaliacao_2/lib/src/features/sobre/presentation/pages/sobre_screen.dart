import 'package:avaliacao_2/src/features/app_bar/presentation/widgets/appbar_leading.dart';
import 'package:avaliacao_2/src/features/cores/core/cores.dart';
import 'package:avaliacao_2/src/features/botao_home/presentation/widgets/button_home.dart';
import 'package:avaliacao_2/src/features/menu/presentation/pages/menu.dart';
import 'package:avaliacao_2/src/features/sobre/presentation/widgets/sobre_app.dart';
import 'package:avaliacao_2/src/features/sobre/presentation/widgets/sobre_equipe.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SobreScreen extends StatelessWidget {
  const SobreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          centerTitle: true,
          backgroundColor: Cores.roxo5,
          leading: const AppBarLeading(),
          actions: const <Widget>[ButtonHome()],
          title: Text(
            'Diário',
            style: GoogleFonts.lato(
              color: Cores.branco,
              fontSize: 30,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
        drawer: const Drawer(
          backgroundColor: Cores.roxo3,
          child: Menu(),
        ),
        body: SingleChildScrollView(
          child: Container (
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: Cores.roxo1,
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 20,),
                SobreApp(),
                SizedBox(height: 20,),
                SobreEquipe(),
                SizedBox(height: 20,)
              ]
            ),
          ),
        ),
      ),
    );
  }
}
