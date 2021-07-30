import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/models/catCard.dart';
import 'package:my_app/widgets/nav-drawer.dart';


class Reload extends StatefulWidget {
  const Reload({Key? key}) : super(key: key);

  @override
  _ReloadState createState() => _ReloadState();
}

class _ReloadState extends State<Reload> {

  TextEditingController a = TextEditingController();


  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;

    double width =MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        title: Text('Reload',style: TextStyle(fontSize: 26.0,fontWeight: FontWeight.bold, color: Colors.white),),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children:[
            SizedBox(height: height * 0.3,),
          Container(
            width:width,
            child: TextField(controller: a,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter reload amount',
              ),
            ),
          ),
          SizedBox(height: 20.0,),
        ])
        )
      )
    );
  }
  Future<CatCard> fetchPost() async {
    final String apiKey = "e110c41ec6bc4586809e232e8f558a73";
    final data = jsonEncode({ "reload": {
      "action": "reload",
      "apikey": apiKey,
      "token": "111222344445555",
      "amount": a.text
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
}

