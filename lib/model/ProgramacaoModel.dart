class ProgramacaoModel {
  int id;
  String titulo;
  String categoria;
  String data;
  String duracao;
  String img;

  ProgramacaoModel(
      {this.id,
      this.titulo,
      this.categoria,
      this.data,
      this.duracao,
      this.img});

  ProgramacaoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    titulo = json['titulo'];
    categoria = json['categoria'];
    data = json['data'];
    duracao = json['duracao'];
    img = json['img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['titulo'] = this.titulo;
    data['categoria'] = this.categoria;
    data['data'] = this.data;
    data['duracao'] = this.duracao;
    data['img'] = this.img;
    return data;
  }
}
