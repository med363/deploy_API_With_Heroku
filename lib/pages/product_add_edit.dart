import 'dart:io';

import 'package:crud_app/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/hex_color.dart';
import 'package:image_picker/image_picker.dart';

class ProductAddEdit extends StatefulWidget {
  const ProductAddEdit({super.key});

  @override
  State<ProductAddEdit> createState() => _ProductAddEditState();
}

class _ProductAddEditState extends State<ProductAddEdit> {
  ProductModel? productModel;
  static final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  bool isAPICallProcess = false;
  bool isEditMode = false;
  bool isImageSelected = false;
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

    @override
  void initState() {
    super.initState();
    productModel = ProductModel();

    Future.delayed(Duration.zero, () {
      if (ModalRoute.of(context)?.settings.arguments != null) {
        final Map arguments = ModalRoute.of(context)?.settings.arguments as Map;
        productModel = arguments['model'];
        isEditMode = true;
        setState(() {});
      }
    });
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
              (onSavedVal) => {
              productModel!.productName = onSavedVal, 
              },
              initialValue: productModel!.productName ?? "",
              obscureText: false,
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
              (onSavedVal) => { 
                productModel!.productPrice = int.parse(onSavedVal),          
                 },
              initialValue: productModel!.productPrice == null
                  ? ""
                  : productModel!.productPrice.toString(),
              obscureText: false,
              borderFocusColor: Colors.black,
              borderColor: Colors.black,
              textColor: Colors.black,
              hintColor: Colors.black.withOpacity(0.7),
              borderRadius: 10,
              showPrefixIcon: false,
              suffixIcon: const Icon(Icons.monetization_on),
            ),
          ),
          //appel de widget
          picPicker(
            isImageSelected,
            productModel!.productImage ?? "",
            (file) => {
              setState(
                () {
                  //model.productPic = file.path;
                  productModel!.productImage = file.path;
                  isImageSelected = true;
                },            
          ),
            },
          ),
          const SizedBox(
            height: 20,
          ),
          //cree submit button
          Center(child: FormHelper.submitButton(
            "save",
            () {
            if (valudateAndSave()){
              //API service

            }
          },
          btnColor: HexColor("#283B71"),
          borderColor: Colors.white,
          borderRadius: 10),)
        ],
      )
    );
}

bool valudateAndSave(){
  final form = globalKey.currentState;
  if (form!.validate()){
    form.save();
    return true;
  }
  return false;
}

//widget for image and two botton to upload image on wich src
 static Widget picPicker(
  bool isFileSelected,
  String filleName,
  Function onFilePicked,
 ) {
  Future<XFile?> _imageFile;
  ImagePicker _picker = ImagePicker();
  return Column(
    children: [
      filleName.isNotEmpty 
      ?isFileSelected
       ? Image.file(File(filleName), 
       height: 200,
       width: 200,
       )
      : SizedBox(
        child: Image.network(
          filleName,
           width: 200,
            height: 200,
             fit: BoxFit.scaleDown,
             ),
             )
      : SizedBox(
        child: Image.network(
          "https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/1665px-No-Image-Placeholder.svg.png",
           width: 200,
            height: 200,
             fit: BoxFit.scaleDown,
             ),
             ),
             //two button on button for glery and other for camera
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 35.0,
                  width: 35.0,
                  child: IconButton(
                    padding: const EdgeInsets.all(0),
                    icon: const Icon(
                      Icons.image,
                      size: 35,
                    ) ,
                    onPressed: (){
                      //action of button
                      _imageFile = _picker.pickImage(source: ImageSource.gallery);
                      _imageFile.then((File) async {
                        onFilePicked(File);
                      });
                    },
                    ),
                ),
                //other button
                 SizedBox(
                  height: 35.0,
                  width: 35.0,
                  child: IconButton(
                    padding: const EdgeInsets.all(0),
                    icon: const Icon(
                      Icons.camera,
                      size: 35,
                    ) ,
                    onPressed: () {
                      _imageFile = _picker.pickImage(source: ImageSource.camera);
                      _imageFile.then((File) async {
                        onFilePicked(File);
                      });
                    },
                    ),
                )

              ],

            ) 

    ],
  );
 }
          
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