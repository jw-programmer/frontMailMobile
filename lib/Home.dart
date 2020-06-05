import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mailsendermodile/Views/EmailForm.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sender Mail Mobile"),
        backgroundColor: Colors.black54,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: EmailForm(),
      ),
    );;
  }
}
