import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:avaliacao_2/src/features/perfil/presentation/widgets/estilo_texto.dart';

class ArquivadosNotifier extends StateNotifier<List<Texto>> {
  ArquivadosNotifier(): super([]);

  void toggleTexto (Texto texto) {
    final estaArquivado = state.contains(texto);

    if (estaArquivado) {
      state = state.where((t) => t.id != texto.id).toList();
    } else {
      state = [...state, texto];
    }
  }

  List<Texto> get textosArq => state;

  bool estaArquivado(Texto texto) {
    return state.any((t) => t.id == texto.id);
  }
}

final arquivadosProvider = 
  StateNotifierProvider<ArquivadosNotifier, List<Texto>>((ref) {
    return ArquivadosNotifier();
});