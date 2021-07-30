import 'package:flutter/material.dart';
import 'package:my_app/Dashboard/Landing.dart';
import 'package:my_app/widgets/nav-drawer.dart';
import '../Setting/Settings.dart';
class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        title: Text('Setting',style: TextStyle(fontSize: 26.0,fontWeight: FontWeight.bold, color: Colors.white),),
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
              // SizedBox(
              //   height: height * 0.05,
              // ),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child:
              //   Text('Setting',style: TextStyle(fontSize: 36.0,fontWeight: FontWeight.bold, color: Colors.white),),
              // ),
              SizedBox(
                height: height * 0.01,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child:
                Text('Account',style: TextStyle(fontSize: 36.0,fontWeight: FontWeight.bold, color: Colors.white),),
              ),
              SizedBox(height: height * 0.05,),
              Container(
            child: Image(
              image:AssetImage('./lib/assets/human.png'),
            ),
              ),
              SizedBox(height: height * 0.1,),
              Container(
                width:width* 0.4 ,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Email',
                  ),
                ),
              ),
              SizedBox(height: 20.0,),
              Container(
                width:width* 0.5,
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Password',
                  ),
                ),
              ),
              SizedBox(height: 20.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width:width* 0.5,
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Phone Number',
                      ),
                    ),
                  ),
                  Container(
                    width:width* 0.5,
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Phone Number',
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30.0,),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Landing()));
                    }, child: Text('Save',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,))),
                    ElevatedButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Settings()));
                    }, child: Text('Discard',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,)))
                  ],
                ),
              ), // This trailing comma makes auto-formatting nicer for build methods.
            ],
          ),
        ),
      ),

    );
  }
}


