import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_app/Dashboard/Landing.dart';

import '../main.dart';



class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailController = TextEditingController();
  TextEditingController pwController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
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
                Column(
                  children: [
                    Text('Create',style: TextStyle(fontSize: 40.0,fontWeight: FontWeight.bold, color: Colors.white),),
                    Text('Account',style: TextStyle(fontSize: 40.0,fontWeight: FontWeight.bold, color: Colors.white),),
                  ],
                ),



              ),
              SizedBox(height: height * 0.2,),
              Container(
                width:width* 0.95 ,
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    hintText: 'Name',
                    suffixIcon: Icon(Icons.drive_file_rename_outline),
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
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
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
                  keyboardType: TextInputType.text,
                  controller: pwController,
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
              SizedBox(height: 20.0,),
              Container(
                width:width* 0.95 ,
                child: TextField(
                  keyboardType: TextInputType.phone,
                  controller: phoneController,
                  obscureText: false,
                  decoration: InputDecoration(
                    hintText: 'Phone Number',
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
                      signUp();
                    }, child: Text('Register'))
                  ],
                ),
              ), // This trailing comma makes auto-formatting nicer for build methods.
              SizedBox(height:20.0),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>MyApp()));
                },
                child: Text.rich(
                  TextSpan(
                      text: 'Already have an account ',
                      children: [
                        TextSpan(
                          text: 'Login',
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

  signUp() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: pwController.text.trim()

      );
      saveUserInfoToFirestore(userCredential.user!).then((value) {
        userCredential.user!.updateDisplayName(nameController.text);


        Route route = MaterialPageRoute(builder: (c) => Landing());
        Navigator.pushReplacement(context, route);
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> saveUserInfoToFirestore(User user) async {

    await FirebaseFirestore.instance.collection("Users").doc(user.uid).set({
      "uid": user.uid,
      "email": emailController.text.trim(),
      "Name": nameController.text.trim(),
      "phoneNumber": phoneController.text.trim(),
      "balance": 0,
    });

  }
}



