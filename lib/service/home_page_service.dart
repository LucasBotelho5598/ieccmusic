import 'package:flutter_treino/models/music.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http_interceptor/http/http.dart';
import 'http_interceptors.dart';

class HomePageService {
  static const String url = "https://iecc-music.uamee.repl.co/";
  static const String resource = "catalogo/";

  String getUrl() {
    return "$url$resource";
  }

  http.Client client = InterceptedClient.build(
    interceptors: [LoggingInterceptor()],
  );

  Uri getUri() {
    return Uri.parse(getUrl());
  }

  Future<List<Music>> getAll() async {
    http.Response response = await client.get(getUri());

    if (response.statusCode != 200) {
      //TODO: Criar uma exceção personalizada
      throw Exception();
    }

    List<Music> result = [];

    List<dynamic> jsonList = json.decode(response.body);

    for (var jsonMap in jsonList) {
      result.add(Music.fromMap(jsonMap));
    }

    return result;
  }
}
