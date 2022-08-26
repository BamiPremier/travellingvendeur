class TypeBilletModel {
  TypeBilletModel({
    required this.id,
    required this.libelle,
  });
  late final int id;
  late final String libelle;

  TypeBilletModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    libelle = json['libelle'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['libelle'] = libelle;
    return _data;
  }
}
