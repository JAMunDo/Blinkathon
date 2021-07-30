import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.purple,
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
              Text(
                "Welcome Back",
                style:
                    TextStyle(fontSize: height * 0.03, fontWeight: FontWeight.w100),
              ),
              Text(
                _auth.displayName! ,
                style:
                    TextStyle(fontSize: height * 0.03, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              Center(
                  child: Text(
                "Balance:",
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
