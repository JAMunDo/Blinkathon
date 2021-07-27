import 'package:flutter/material.dart';
import 'package:my_app/Dashboard/Landing.dart';

import 'SignUp.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.

      ),
      body: Container(
        height:height,
        width:width,
        child: SingleChildScrollView(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: width,
                height:height*0.35,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Center(
                      child: Text('Login',style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold),),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30.0,),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Email',
                  suffixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
              SizedBox(height: 20.0,),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
                  suffixIcon: Icon(Icons.visibility_off),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
              SizedBox(height: 30.0,),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Forget password?',style: TextStyle(fontSize: 15.0),),
                    ElevatedButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Landing()));
                    }, child: Text('Login'))
                  ],
                ),
              ), // This trailing comma makes auto-formatting nicer for build methods.
              SizedBox(height:20.0),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));
                },
                child: Text.rich(
                  TextSpan(
                      text: 'Don\'t have an account ',
                      children: [
                        TextSpan(
                          text: 'Signup',
                          style: TextStyle(
                              color: Color(0xffEE7B23)
                          ),
                        ),
                      ]
                  ),
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}

void login(){

}
