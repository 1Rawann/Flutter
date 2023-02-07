import 'package:ecommerce/models/item_model.dart';
import 'package:flutter/material.dart';

class AddItemDialog extends Dialog {

  final nameController = TextEditingController();
  final imageController = TextEditingController();
  final priceController = TextEditingController();
  final categoryController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      elevation: 14,
      backgroundColor: Colors.white,
      child: Container(
        height: 400,
        width: 300,
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Name',
              ),

            ),
            SizedBox(height:20),

            TextField(
              controller:priceController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'price',
              ),
            ),

            SizedBox(height: 20),

            TextField(
              controller:categoryController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Category',
              ),
            ),

            SizedBox(height: 20),

            TextField(
              controller: imageController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Image',
              ),
            ),



            Container(
              width: 200,
              margin: EdgeInsets.only(top: 30),
              child: ElevatedButton(
                onPressed: (){
                  var newItem = new Item( name:nameController.text, category: categoryController.text, image: imageController.text,  price: priceController.text , id: 0);
                  Navigator.pop(context, newItem);
                },
                child: Text("Add"),
              ),
            )

          ],
        ),
      ),
    );
  }
}