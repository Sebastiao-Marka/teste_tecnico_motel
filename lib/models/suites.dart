class Suites {
  final String name;
  final int quantd;
  final bool disponivel;
  final List<dynamic> fotos;
  final List<dynamic> itens;
  final List<dynamic> categorias;
  final List<dynamic> periodos;

  Suites({
    required this.itens,
    required this.categorias,
    required this.periodos,
    required this.name,
    required this.quantd,
    required this.disponivel,
    required this.fotos,
  });

  static Suites suites(body) {
    Suites suite = Suites(
      name: body["nome"],
      quantd: body["qtd"],
      disponivel: body["exibirQtdDisponiveis"],
      fotos: body["fotos"],
      itens: body["itens"],
      categorias: body["categoriaItens"],
      periodos: body["periodos"],
    );
    return suite;
  }
}
