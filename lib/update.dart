import 'package:flutter/material.dart';
import 'package:flutter_tes/database_instance.dart';
import 'package:flutter_tes/product_model.dart';
class UpdateScreen extends StatefulWidget {
 final ProductModel? productModel;
 const UpdateScreen({Key? key, this.productModel}) : super(key:key);
 @override
 State<UpdateScreen> createState() => _UpdateScreenState();
}
class _UpdateScreenState extends State<UpdateScreen> {
 DatabaseInstance databaseInstance = DatabaseInstance();
 TextEditingController nameController = TextEditingController();
 TextEditingController categoryController = TextEditingController();
 @override
 void initState() {
 // TODO: implement initState
 databaseInstance.database();
 nameController.text = widget.productModel!.name ?? '';
 categoryController.text = widget.productModel!.category ?? '';
 super.initState();
 }
 @override
 Widget build(BuildContext context) {
 return Scaffold(
 appBar: AppBar(title: Text('edit'),),
 body: Padding(
 padding: const EdgeInsets.all(8.0),
 child: Column(
 crossAxisAlignment: CrossAxisAlignment.start,
 children: [
 Text('Nama Produk'),
 TextField(
 controller: nameController,
 ),
 SizedBox(
 height: 15,
 ),
 Text('Kategori'),
 TextField(
 controller: categoryController,
 ),
 SizedBox(
 height: 15,
 ),
 ElevatedButton(onPressed: () async {
 await databaseInstance.update(widget.productModel!.id!,{
 'name' : nameController.text,
 'category' : categoryController.text,
 'updated_at' : DateTime.now().toString()
 });
 Navigator.pop(context);
 }, child: Text('Submit'))
 ],
 ),
 ),
 );
 }
} 
