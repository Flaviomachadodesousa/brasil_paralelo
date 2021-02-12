class SeriesModel {
  int id;
  String titulo;
  String categoria;
  String lancamento;
  String duracao;
  String img;

  SeriesModel(
      {this.id,
      this.titulo,
      this.categoria,
      this.lancamento,
      this.duracao,
      this.img});

  SeriesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    titulo = json['titulo'];
    categoria = json['categoria'];
    lancamento = json['lancamento'];
    duracao = json['duracao'];
    img = json['img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['titulo'] = this.titulo;
    data['categoria'] = this.categoria;
    data['lancamento'] = this.lancamento;
    data['duracao'] = this.duracao;
    data['img'] = this.img;
    return data;
  }
}
