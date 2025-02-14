import 'package:avaliacao_2/src/features/app_bar/presentation/widgets/appbar_leading.dart';
import 'package:avaliacao_2/src/features/cores/core/cores.dart';
import 'package:avaliacao_2/src/features/botao_home/presentation/widgets/button_home.dart';
import 'package:avaliacao_2/src/features/menu/presentation/pages/menu.dart';
import 'package:avaliacao_2/src/features/providers/text_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ArquivadosScreen extends ConsumerStatefulWidget {
  const ArquivadosScreen({super.key});

  @override
  ConsumerState<ArquivadosScreen> createState() => _ArquivadosScreenState();
}

class _ArquivadosScreenState extends ConsumerState<ArquivadosScreen> {
  @override
  Widget build(BuildContext context) {
    final arquivados = ref.watch(arquivadosProvider);

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
        body: Container (
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            color: Cores.roxo1,
          ),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                'Arquivados',
                style: TextStyle(
                  color: Cores.branco,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: arquivados.length,
                  itemBuilder: (context, index) {
                    final textoItem = arquivados[index];
                
                    return Container (
                      decoration: BoxDecoration(color: Cores.roxo2),
                      child: ListTile (
                        leading: IconButton(
                          onPressed: () {
                            ref.read(arquivadosProvider.notifier).toggleTexto(textoItem);
                          },
                          icon: Icon(
                            ref.read(arquivadosProvider.notifier).estaArquivado(textoItem)
                              ? Icons.archive 
                              : Icons.archive_outlined,
                          ),
                        ),
                        iconColor: Cores.branco,
                        title: Text(
                          textoItem.texto,
                          style: GoogleFonts.lato(
                            fontSize: 20,
                          ),
                        ),
                        textColor: Cores.branco,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
