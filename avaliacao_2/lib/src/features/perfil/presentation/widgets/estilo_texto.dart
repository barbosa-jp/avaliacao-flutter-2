class Texto {
  final String id;
  final String texto;
  final String tipo;

  Texto({required this.id, required this.texto, required this.tipo});

  factory Texto.fromMap(Map<String, dynamic> map) {
    return Texto(
        id: map['id'] ?? '', texto: map['texto'] ?? 'Texto não encontrado', tipo: map['tipo']);
  }
}
