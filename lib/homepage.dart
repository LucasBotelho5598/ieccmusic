import 'package:flutter/material.dart';
import 'package:flutter_treino/music.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  get actionIcon => null;
  final controller = TextEditingController();
  List<Music> _music = [];

  @override
  void initState() {
    super.initState();

    setState(() {
      _music = musicList;
    });
  }

  onSearch(String search) {
    setState(() {
      _music = musicList
          .where((musicList) => musicList.name.toLowerCase().contains(search))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blue,
          elevation: 0,
          title: Text("IECC Music"),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                setState(() {                  
                });
              },
            )
          ]),
      body: ListView.builder(
        itemCount: musicList.length,
        itemBuilder: (context, index) {
          Music music = musicList[index];
          return Card(
            child: ListTile(
              title: Text(music.title),
              subtitle: Text(music.cantor),
            ),
          );
        },
      ),
    );
  }
}
