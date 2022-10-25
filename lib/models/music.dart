class Music {
  String id;
  final String title;
  final String cantor;

  var name = '';

  Music({
    required this.id,
    required this.title,
    required this.cantor,
  });

  static Music fromJson(json) =>
      Music(id: json['id'], title: json['title'], cantor: json['cantor']);

  Music.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        title = map['title'],
        cantor = map['cantor'];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'cantor': cantor,
    };
  }
}

List<Music> musicList = [
  // Music(title: 'Abraça - Me [ G ]', cantor: 'David Quilan'),
  // Music(title: 'Em teus braços [ C ]', cantor: 'Laura Souguelis'),
  // Music(title: 'Abraça - Me [ A ]', cantor: 'David Quilan'),
  // Music(title: 'Consagração [ A ]', cantor: 'Aline Barros'),
  // Music(title: 'Eu Navegarei [ Am ]', cantor: 'Harpa Cristã'),
  // Music(title: 'Ruja o Leão [ F#m ]', cantor: 'Talita Catanzaro')
];
