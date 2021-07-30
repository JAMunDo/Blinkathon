import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/Dashboard/Landing.dart';
import 'package:my_app/widgets/nav-drawer.dart';

import 'models/catCard.dart';

class Payment extends StatefulWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {

  TextEditingController a = TextEditingController();
  TextEditingController b = TextEditingController();
  TextEditingController c = TextEditingController();
  int _value = 1;
  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        title: Text('Payment',style: TextStyle(fontSize: 26.0,fontWeight: FontWeight.bold, color: Colors.white),),
      ),
      body: Container(
        decoration:
        BoxDecoration(
            image:
            DecorationImage(
                image: AssetImage('./lib/assets/backdrop.png'),
                //scale: 1,
                fit:BoxFit.fitHeight
            )
        ),
        height:height,
        width:width,
        child: SingleChildScrollView(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment:CrossAxisAlignment.center ,
            children: [
              SizedBox(
                height: height * 0.05,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child:
                Text('Digital Payment',style: TextStyle(fontSize: 36.0,fontWeight: FontWeight.bold, color: Colors.white),),
              ),
              SizedBox(height: height * 0.3,),
              Container(
                width:width,
                child: TextField(controller: a,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Recipient Phone Number',
                  ),
                ),
              ),
              SizedBox(height: 20.0,),
              Container(
                width:width,
                child: TextField(
                  controller:b,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Amount',
                  ),
                ),
              ),
              SizedBox(height: 20.0,),
              Container(
                child:DropdownButton(
                    value: _value,
                    items: [
                      DropdownMenuItem(
                        child: Text("MasterCard"),
                        value: 1,
                      ),
                      DropdownMenuItem(
                        child: Text("Visa"),
                        value: 2,
                      )
                    ],
                    onChanged: (int? value) {
                      setState(() {
                        _value = value!;
                      });
                    },
                    hint:Text("Select item"))
              ),
              SizedBox(height: 20.0,),
                  Container(
                    width:width,
                    child: TextField(
                      controller:c,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Message',
                      ),
                    ),
                  ),
              SizedBox(height: 30.0,),
              ElevatedButton(onPressed: (){
                fetchPost();
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Landing()));
              }, child: Text('Send',style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold,))),// This trailing comma makes auto-formatting nicer for build methods.
            ],
          ),
        ),
      ),

    );
  }
  Future<CatCard> fetchPost() async {
    final String apiKey = "e110c41ec6bc4586809e232e8f558a73";
    final data = jsonEncode({
      "gift": {
        "action": "order",
        "apikey": "5c80278bbd1a46b991e671a4056ec609",
        "sender": "Romario.",
        "from": "8768682192",
        "dest": a.text,
        "code": "218",
        "amount": b.text,
        "postal": "30005",
        "msg": c.text,
        "reference": "7563834856",
        "handle_delivery": false
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


