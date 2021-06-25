class Contato {
  String? id;
  String nome;
  String telefone;

  Contato({
    this.id,
    required this.nome,
    required this.telefone,
  });

  @override
  String toString() {
    return 'Contato{id: $id, nome: $nome, telefone: $telefone}';
  }
}
