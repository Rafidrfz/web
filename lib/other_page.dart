import 'package:flutter_tes/counter_page.dart';
import 'package:flutter/material.dart';
class OtherPage extends StatelessWidget {
 static const routeName = "/other-page";
 const OtherPage({super.key});
 @override
 Widget build(BuildContext context) {
 return Scaffold(
 appBar: AppBar(title: Text("Other Page"),),
 body: Center(
 child: OutlinedButton(onPressed: () {
 Navigator.pushReplacementNamed(context, CounterPage.routeName,
arguments: ModalRoute.of(context)?.settings.arguments as int);
 }, child: Text("Go to counter page"))),
 );
 } 
}