import 'package:flutter/material.dart';

class Payment extends StatefulWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // appBar: (),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
image: AssetImage("Pay.jpg"),
            fit: BoxFit.cover,
          )
        ),
      ),
    );
  }
}
