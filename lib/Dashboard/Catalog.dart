import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/models/catCard.dart';

class Catalog extends StatefulWidget {
  const Catalog({Key? key}) : super(key: key);

  @override
  _CatalogState createState() => _CatalogState();
}

class _CatalogState extends State<Catalog> {
  late Future<CatCard> Cats;
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    Cats = fetchPost();
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder<CatCard>(
          future: Cats,
          builder: (context, abc) {
            if (abc.hasData) {
              return Text(abc.data!.caption);
            } else if (abc.hasError) {
              print(abc.error);
              return Text("${abc.error}");
            }

            // By default, it show a loading spinner.
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}

Future<CatCard> fetchPost() async {
  final String apiKey = "e110c41ec6bc4586809e232e8f558a73";
  final data = jsonEncode({
    "service": {
      "apikey": apiKey
    }
  });
  final response =
      await http.post(Uri.parse('https://api.blinksky.com/api/v1/send'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=utf-8',
          },
          body: data);

  print(response.statusCode);
  print(response.body);
  final body = json.decode(response.body);

  print(body);
  print('${response.body[12]}');



  if (response.statusCode == 200) {
    // If the server returns an OK response, then parse the JSON.
    return CatCard.fromJson(body);

  } else {
    // If the response was unexpected, throw an error.
    throw Exception('Failed to load card');
  }
}
