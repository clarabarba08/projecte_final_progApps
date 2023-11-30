class Grup {
  String nom;
  String foto;
  List<String> membres;

  Grup(this.nom, this.foto, this.membres);

  // Constructor de la classe Recepta que rep un map amb les dades de la recepta
  Grup.fromJson(Map<String, dynamic> json)
      : nom = json['nom'],
        foto = json['foto'],
        membres = json['membres'];

  // Funció per convertir les dades de la recepta en format JSON
  Map<String, dynamic> toJson() => {
        'nom': nom,
        'foto': foto,
        'grups': membres,
      };

  bool hasSameContent(Grup other) {
    return nom == other.nom && foto == other.foto;
  }
}
