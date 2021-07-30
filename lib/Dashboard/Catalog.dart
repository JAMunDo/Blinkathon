import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
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
               print(abc.error); return Text("${abc.error}");
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
  final url = Uri.parse('https://api.blinksky.com/api/v1/catalog');
  Map data = {
    'service':
     'apikey: $apiKey' ,
  } ;

  HttpClient httpClient = new HttpClient();
  HttpClientRequest request = await httpClient.postUrl(url);
  request.headers.set('content-type', 'application/json');
  request.add(utf8.encode(json.encode(data)));
  HttpClientResponse response = await request.close();
  print(response.statusCode);
  // todo - you should check the response.statusCode
  String reply = await response.transform(utf8.decoder).join();
  print('Response status: ${response.statusCode}');
  httpClient.close();



  print(response.statusCode);



  if (response.statusCode == 200) {
    // If the server returns an OK response, then parse the JSON.
    return CatCard.fromJson(json.decode('apikey'));
  } else {
  // If the response was unexpected, throw an error.
  throw Exception('Failed to load card');
  }
}




