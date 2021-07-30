import 'package:flutter/material.dart';
import 'package:my_app/Dashboard/Landing.dart';
import 'package:my_app/widgets/nav-drawer.dart';
import '../Setting/Settings.dart';
class Payment extends StatefulWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
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
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Reciepient Phone Number',
                  ),
                ),
              ),
              SizedBox(height: 20.0,),
              Container(
                width:width,
                child: TextField(
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
                        child: Text("E-gift Card"),
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
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Message',
                      ),
                    ),
                  ),
              SizedBox(height: 30.0,),
              ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Landing()));
              }, child: Text('Send',style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold,))),// This trailing comma makes auto-formatting nicer for build methods.
            ],
          ),
        ),
      ),

    );
  }
}


