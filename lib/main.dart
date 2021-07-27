import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/widgets/nav-drawer.dart';

void main() {
  runApp(MaterialApp(home:MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

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

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
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
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>MyApp()));
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
}

class Landing extends StatefulWidget {
  @override
  _LandingState createState() => _LandingState();
}

class _LandingState  extends State<Landing>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        title: Text('Side menu'),
      ),
      body: Center(
        child: Text('Side Menu Tutorial'),
      ),
    );
  }
}