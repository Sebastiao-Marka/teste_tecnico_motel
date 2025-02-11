class Notifications {
  final List<String> mensage;
  final int quantidade;

  Notifications({
    required this.quantidade,
    required this.mensage,
  });
  static Notifications mensagem(mensage) {
    final List<String> mensage = [];
    var quantidade = mensage.length;
    for (int i = 0; mensage.length > i; i++) {
      mensage.add(mensage[i]);
    }
    final Notifications mensagens = Notifications(
      quantidade: quantidade,
      mensage: mensage,
    );
    return mensagens;
  }
}
