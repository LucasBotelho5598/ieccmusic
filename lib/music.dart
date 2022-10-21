class Music {
  final String title;
  final String cantor;

  var name;

  Music(
    {
    required this.title,
    required this.cantor,
  });
  
}

List<Music> musicList = [  
  Music(title: 'Abraça - Me [ G ]', cantor: 'David Quilan'),
  Music(title: 'Em teus braços [ C ]', cantor: 'Laura Souguelis'),
  Music(title: 'Abraça - Me [ A ]', cantor: 'David Quilan'),
  Music(title: 'Consagração [ A ]', cantor: 'Aline Barros'),
  Music(title: 'Eu Navegarei [ Am ]', cantor: 'Harpa Cristã'),
  Music(title: 'Ruja o Leão [ F#m ]', cantor: 'Talita Catanzaro')
];
