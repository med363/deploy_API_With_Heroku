import 'package:crud_app/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductList  extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  List<ProductModel> products = List<ProductModel>.empty(growable: true);

  @override
  void initState(){
    super.initState();
    products.add(
      ProductModel(
        id: "1",
        productName: "prod1",
        productImage: "https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/1665px-No-Image-Placeholder.svg.png",
        productPrice: 500
      ),
    );
  }
  Widget ProductList(products){
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              onPrimary: Color.fromRGBO(100, 100, 0, 1.0),
              primary: Color.fromARGB(255, 255, 255, 255),
              minimumSize: const Size(88, 36),
              padding: const EdgeInsets.symmetric(horizontal: 60),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10)
                )
              )
            ),
            onPressed: () {
              
            },
            child: const Text("Add Product"),
            )
        ],
      ),
    );

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("crud"),
        elevation: 0,
      ),
      backgroundColor: Color.fromARGB(180, 122, 120, 120),
      body: ProductList(products),
    );
  }
}