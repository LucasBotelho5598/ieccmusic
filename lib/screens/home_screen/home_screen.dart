import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_treino/models/music.dart';
import 'package:flutter_treino/screens/cipher_screen/cipher_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  get actionIcon => null;
  final controller = TextEditingController();
  //List<Music> _music = [];
  Future<List<Music>> musicsFuture = getMusics();

  static Future<List<Music>> getMusics() async {
    //TODO: Melhorar isso aqui
    const url = 'https://iecc-music.uamee.repl.co/catalogo';
    final response = await http.get(Uri.parse(url));

    final body = json.decode(response.body);
    return body.map<Music>(Music.fromJson).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("IECC Music"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: IconButton(
                onPressed: () {
                  //TODO: Implementar busca com dropdownbutton
                },
                icon: Icon(Icons.search)),
            onPressed: () {
              setState(() {});
            },
          )
        ],
      ),
      //TODO: Carregadar da web
      body: Center(
        child: FutureBuilder<List<Music>>(
          future: musicsFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Algo deu errado! ${snapshot.error}');
            } else if (snapshot.hasData) {
              final musics = snapshot.data!;

              return generateCards(musics);
            } else {
              return const Text('Sem Musicas.');
            }
          },
        ),
      ),
    );
  }

  Widget generateCards(List<Music> musics) => ListView.builder(
        itemCount: musics.length,
        itemBuilder: (context, index) {
          final music = musics[index];

          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/cipher');
            },
            child: Card(
              child: ListTile(
                title: Text(music.title),
                subtitle: Text(music.cantor),
              ),
            ),
          );
        },
      );
}
