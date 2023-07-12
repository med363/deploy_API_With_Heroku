import 'package:crud_app/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductItem  extends StatelessWidget {
  const ProductItem ({  key, this.model,this.onDelete}) : super(key: key);
  final ProductModel? model;
  final Function? onDelete;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: Container(
        width: 200,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Text(model!.productName ?? ""),
      ),
    );
  }
}