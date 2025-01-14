import 'package:flutter/material.dart';
import 'package:flutter_tes/widgets/widget_counter.dart';

class CounterPage extends StatefulWidget {
 static const routeName = "/counter-page";
 CounterPage() {
 print("==================");
 print("constructor Counter Page");
 }
 @override
 State<CounterPage> createState() {
 return _CounterPageState();
 }
}
class _CounterPageState extends State<CounterPage> with
WidgetsBindingObserver{
 int counter = 0;
 @override
 void initState() {
 super.initState();
 WidgetsBinding.instance.addObserver(this);
 }
 @override
 void didChangeDependencies() {
 if(ModalRoute.of(context)?.settings.arguments != null){
 print("Nilai telah dikembalikan");
 int numberState = ModalRoute.of(context)?.settings.arguments as int;
 counter = numberState;
 }
 super.didChangeDependencies();
 }
 @override
 void didChangeAppLifecycleState(AppLifecycleState state) {
 print('AppLifecycleState: $state');
 switch (state) {
 case AppLifecycleState.inactive:
 print('appLifeCycleState inactive');
 break;
 case AppLifecycleState.resumed:
 print('appLifeCycleState resumed');
 break;
 case AppLifecycleState.paused:
 print('appLifeCycleState paused');
 break;
 case AppLifecycleState.detached:
 print('appLifeCycleState detached');
 break;
 case AppLifecycleState.hidden:
 print('appLifeCycleState hidden');
 break;
 }
 super.didChangeAppLifecycleState(state);
 }
 //untuk mengatasi kebocoran memori widgetbinding di remove
 @override
 void dispose() {
 WidgetsBinding.instance.removeObserver(this);
 super.dispose();
 }
 @override
 Widget build(BuildContext context) {

 return Scaffold(
 appBar: AppBar(
 title: Text("Counter Page"),
 ),
 body: WidgetCounter(counter: counter),
 floatingActionButton: FloatingActionButton(
 onPressed: () {
 setState(() {
 counter++;
 });
 },
 child: Icon(Icons.add),
 ),
 );
 }
} 