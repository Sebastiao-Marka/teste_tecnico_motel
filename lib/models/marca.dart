class Motel {
  final String name;
  final String logo;
  final String endereco;
  final double distancia;

  Motel({
    required this.name,
    required this.endereco,
    required this.logo,
    required this.distancia,
  });
  static Motel motel(body) {
    final Motel marca = Motel(
      name: body["data"]["moteis"][0]["fantasia"],
      endereco: body["data"]["moteis"][0]["bairro"],
      logo: body["data"]["moteis"][0]["logo"],
      distancia: body["data"]["moteis"][0]["distancia"],
    );

    return marca;
  }
}
