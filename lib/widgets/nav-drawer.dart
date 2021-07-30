import 'package:flutter/material.dart';
import 'package:my_app/Dashboard/Catalog.dart';
import 'package:my_app/Dashboard/Landing.dart';
import 'package:my_app/Dashboard/Reload.dart';
import 'package:my_app/Dashboard/Landing.dart';

import '../Payment.dart';
import '../Setting/Settings.dart';
class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'Navigation',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            decoration: BoxDecoration(
                color: Colors.purpleAccent,
              image: DecorationImage(
                image: AssetImage("./lib/assets/Pay.jpg"),
                    fit: BoxFit.cover
              )
              ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () => {

              Navigator.push(context, MaterialPageRoute(builder: (context)=> Landing()))},
          ),
          ListTile(
            leading: Icon(Icons.payments_sharp),
            title: Text('Payment'),
            onTap: () => {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Payment()))
            },
          ),
          ListTile(
            leading: Icon(Icons.money),
            title: Text('Reload'),
            onTap: () => {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Reload()))
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () => {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Settings()))
          }
          ),
          ListTile(
            leading: Icon(Icons.border_color),
            title: Text('Catalog'),
            onTap: () => {Navigator.push(context, MaterialPageRoute(builder: (context)=>Catalog()))},
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () => {Navigator.of(context).pop()},
          ),
        ],
      ),
    );
  }
}