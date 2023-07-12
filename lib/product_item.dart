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
        child: productWidget(context),
      ),
    );
  }
  Widget productWidget(context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 120,
          alignment: Alignment.center,
          margin: const EdgeInsets.all(10),
          child: Image.network(
            (model!.productImage == null || model!.productImage == "") 
            ? "https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/1665px-No-Image-Placeholder.svg.png"
            : model!.productImage!,
            height: 70,
            fit: BoxFit.scaleDown,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                model!.productName!,
                style: const TextStyle(
                  color: Color.fromARGB(66, 50, 80, 40),
                  fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "${model!.productPrice}",
                style: const TextStyle(color: Colors.black),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width - 180,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      child: const Icon(
                        Icons.edit
                      ),
                      onTap: () {},
                      ),
                    GestureDetector(
                      child: const Icon(
                        Icons.delete,
                        color: Color.fromARGB(200, 180, 120, 120),
                      ),
                      onTap: () {
                        onDelete!(model);
                      },
                      )

                  ],
                ),
              )
            ],
          ),

        )
      ],
    );
  }
}