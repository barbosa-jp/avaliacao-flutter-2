class Texto {
  final String id;
  final String texto;

  Texto({required this.id, required this.texto});

  factory Texto.fromMap(Map<String, dynamic> map) {
    return Texto(
      id: map['id'] ?? '',
      texto: map['texto'] ?? 'Texto não encontrado'
    );
  }
}