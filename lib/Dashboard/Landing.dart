import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/models/catCard.dart';
import 'package:my_app/widgets/nav-drawer.dart';

class Landing extends StatefulWidget {
  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> {




  @override
  Widget build(BuildContext context) {
    final _auth = FirebaseAuth.instance.currentUser;
    print(_auth?.uid);
    check(_auth!);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    fetchPost();
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        height: height,
        child: Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * 0.05,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Welcome Back",
                  style:
                      TextStyle(fontSize: height * 0.04, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  _auth.displayName! ,
                  style:
                      TextStyle(fontSize: height * 0.03, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              Center(
                  child: Text(
                "Balance: 0.00"  ,
                style: TextStyle(fontSize: height * 0.03),
              )),
              SizedBox(
                height: height * 0.05,
              ),
              GridView.count(
                crossAxisCount: 2,
                childAspectRatio: (height / width),
                shrinkWrap: true,
                children: [
                  payCard(),
                  payCard(),
                  payCard(),
                  payCard(),
                ],
              ),
              SizedBox(height: height* 0.025,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Recent Transactions"),
                  GestureDetector(
                    onTap: (){},
                    child: Text("See all"),
                  )
                ],
              ),
              // Container(
              //   decoration: BoxDecoration(
              //     color: Colors.deepPurple,
              //     borderRadius: BorderRadius.only(
              //       topLeft: const Radius.circular(40.0),
              //       topRight: const Radius.circular(40.0),
              //
              //     ),),
              //   height: height * 0.335,
              //
              // )
            ],
          ),
        ),
      ),
    );
  }
  Future<CatCard> fetchPost() async {
    final String apiKey = "e110c41ec6bc4586809e232e8f558a73";
    final data = jsonEncode({
      "service": {
        "action": "getbalance",
        "apikey": apiKey
      }
    });
    final response =
    await http.post(Uri.parse('https://api.blinksky.com/api/v1/query'),
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


payCard() {
  return Card(
    child: InkWell(
      child: Ink.image(
          image: NetworkImage(
              "https://p.kindpng.com/picc/s/172-1729507_amazon-gift-card-png-image-amazon-gift-card.png")),
    ),
  );
}

check(User user){
  FirebaseAuth.instance
      .authStateChanges()
      .listen(( user) {
    if (user == null) {
      print('User is currently signed out!');
    } else {
      print('User is signed in!');
    }
  });
}
