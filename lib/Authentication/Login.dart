import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_app/Dashboard/Landing.dart';

import 'SignUp.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController pwController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        decoration:
        BoxDecoration(
            image:
            DecorationImage(
                image: AssetImage('./lib/assets/Android - 1.jpg'),
                fit:BoxFit.cover
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
            height: height * 0.2,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child:
            Text('BlinkX',style: TextStyle(fontSize: 50.0,fontWeight: FontWeight.bold, color: Colors.white),),



          ),
          SizedBox(height: height * 0.3,),
          Container(
            width:width* 0.95 ,
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Email',
                suffixIcon: Icon(Icons.email),
              ),
            ),
            decoration: BoxDecoration(
                border:Border(
                    bottom: BorderSide(
                      width:0.3,
                    )
                )
            ),
          ),
          SizedBox(height: 20.0,),
          Container(
            width:width* 0.95 ,
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Password',
                suffixIcon: Icon(Icons.visibility_off),
              ),
            ),
            decoration: BoxDecoration(
                border:Border(
                    bottom: BorderSide(
                      width:0.3,
                    )
                )
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
                  login();

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
  Future<void> login() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: pwController.text.trim()
      );
      Navigator.push(context, MaterialPageRoute(builder: (context)=>Landing()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }
}


