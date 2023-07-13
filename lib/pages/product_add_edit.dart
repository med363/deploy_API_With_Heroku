import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

class ProductAddEdit extends StatefulWidget {
  const ProductAddEdit({super.key});

  @override
  State<ProductAddEdit> createState() => _ProductAddEditState();
}

class _ProductAddEditState extends State<ProductAddEdit> {
  static final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  bool isAPICallProcess = false;
  @override
  Widget build(BuildContext context) {
    return 
    SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Edit product"),
          elevation: 0,
        ),
        backgroundColor: Colors.white,
        body: ProgressHUD(
          
          child: Form(
            key: globalKey,
            child: productForm(),
          ),
        ),
      ),
    );
  }

Widget productForm() {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              bottom: 10,
              top: 10,
            ),
            child: FormHelper.inputFieldWidget(
              context,
              "ffffff",
              "ProductName",
              (onValidateVal) {
                if (onValidateVal.isEmpty) {
                  return 'ProductName can\'t be empty.';
                }

                return null;
              },
              (onSavedVal) => {},
              borderFocusColor: Colors.black,
              borderColor: Colors.black,
              textColor: Colors.black,
              hintColor: Colors.black.withOpacity(.7),
              borderRadius: 10,
              showPrefixIcon: false,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 10,
              top: 10,
            ),
            child: FormHelper.inputFieldWidget(
              context,
              "pppp",
              "ProductPrice",
              (onValidateVal) {
                if (onValidateVal.isEmpty) {
                  return 'Product Price can\'t be empty.';
                }

                return null;
              },
              (onSavedVal) => {    },
              borderFocusColor: Colors.black,
              borderColor: Colors.black,
              textColor: Colors.black,
              hintColor: Colors.black.withOpacity(0.7),
              borderRadius: 10,
              showPrefixIcon: false,
              suffixIcon: const Icon(Icons.monetization_on),
            ),
          )
        ],
      )
    );
}

//widget for image and two botton to upload image on wich src
          
    // Widget productForm(){
  //   return SingleChildScrollView(
  //     child: Column(
  //       mainAxisAlignment: MainAxisAlignment.start,
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Padding(
  //           padding: const EdgeInsets.only(bottom: 10, top:10),
  //           child: Column(children: [

  //           ],)
            /*child: FormHelper.inputFieldWidget(
              context, 
              Icon(
                Icons.edit
                ), 
              "ProductName", 
              (onValidateVal) {
                if (onValidateVal.isEmpty){
                  return 'ProductName can`t be empty';
                                 
                }
                return null;
              },
              (onSavedVal) {},
              borderColor: Colors.black,
              borderFocusColor: Colors.black.withOpacity(.7),
              borderRadius: 10,
              showPrefixIcon: false

              ),*/
           
  
}