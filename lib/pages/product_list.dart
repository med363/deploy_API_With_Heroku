import 'package:crud_app/api_service.dart';
import 'package:crud_app/models/product_model.dart';
import 'package:crud_app/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
    // products.add(
    //   ProductModel(
    //     id: "1",
    //     productName: "prod1",
    //     productImage: "https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/1665px-No-Image-Placeholder.svg.png",
    //     productPrice: 500
    //   ),
    // );
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
              Navigator.pushNamed(context, "/add-product");              
            },
            child: const Text("Add Product"),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: products.length,
              itemBuilder: (context, index) {
                return ProductItem(
                  model: products[index],
                  onDelete: (ProductModel model) {},
                );
              },)
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
      body: loadProducts(),
    );
  }

  //cree widged to load data
    Widget loadProducts() {
    return FutureBuilder(
      future: APIservie.getProducts(),
      builder: (
        BuildContext context,
        AsyncSnapshot<List<ProductModel>?> model,
      ) {
        if (model.hasData) {
          return ProductList(model.data);
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}