import 'dart:convert';
import 'dart:ui';

import 'package:assignment/ProductController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:http/http.dart' as http;

class CRUDexample extends StatefulWidget {
  const CRUDexample({super.key});

  @override
  State<CRUDexample> createState() => _CRUDexampleState();
}

class _CRUDexampleState extends State<CRUDexample> {
  final productController _prcontroller = productController();
  void productDialog() {
    TextEditingController _ProductNameController = TextEditingController();
    TextEditingController _ProductCodeController = TextEditingController();
    TextEditingController _ProductImageController = TextEditingController();
    TextEditingController _ProductQtyController = TextEditingController();
    TextEditingController _ProductUnitPriceController = TextEditingController();
    TextEditingController _ProductTotalPriceController = TextEditingController();
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(
                "Add Product",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: _ProductNameController,
                    decoration: InputDecoration(labelText: "Product Name"),
                  ),
                  TextField(
                    controller: _ProductImageController,
                    decoration: InputDecoration(labelText: "Product Image"),
                  ),
                  TextField(
                    controller: _ProductQtyController,
                    decoration: InputDecoration(labelText: "Product Qty"),
                  ),
                  TextField(
                    controller: _ProductUnitPriceController,
                    decoration:
                        InputDecoration(labelText: "Product Unit Price"),
                  ),
                  TextField(
                    controller: _ProductTotalPriceController,
                    decoration: InputDecoration(labelText: "Total Price"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextButton(onPressed: () {}, child: Text("close")),
                      ElevatedButton(
                        onPressed: () {
                          _prcontroller.createProduct(_ProductNameController.text, _ProductImageController.text, int.parse(_ProductQtyController.text), int.parse(_ProductUnitPriceController.text), int.parse(_ProductTotalPriceController.text));
                          fetchdata();
                          Navigator.pop(context);

                        },
                        child: Text("Add Button"),
                      ),
                    ],
                  )
                ],
              ),
            ));
  }

  Future<void> fetchdata() async {
    await _prcontroller.fetchProduct();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchdata();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Products"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => productDialog(),
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
          itemCount: _prcontroller.products.length,
          itemBuilder: (context, index) {
            final pr = _prcontroller.products[index];
            return Card(
              elevation: 4,
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: ListTile(
                //leading: Image.network(pr['Img']),
                title: Text(
                  pr['ProductName'],
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  "Price: \$ ${pr['UnitPrice']}, Qty: ${pr['Qty']}",
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(onPressed: () => productDialog(), icon: Icon(Icons.edit)),
                    SizedBox(
                      height: 4,
                    ),
                    IconButton(onPressed: () {}, icon: Icon(Icons.delete))
                  ],
                ),
              ),
            );
          }),
    );
  }

}
