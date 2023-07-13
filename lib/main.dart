import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter ',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        primaryColor: Colors.blue,
      ),
      home: EditProfilUI(),
    );
  }
}

class EditProfilUI extends StatefulWidget {
 @override
  State<EditProfilUI> createState() => _EditProfilUIState();
}

class _EditProfilUIState extends State<EditProfilUI> {
  bool isObscurePassword = true;
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Edit Profile UI"),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
            ),
            onPressed: () {},
            ),
          actions: [
            IconButton(onPressed: () {},
             icon: Icon(
              Icons.settings,
              color: Colors.white,
             ),
             )
          ],
      ),
      body: Container(
        padding: EdgeInsets.only(left: 15, top: 20, right: 15),
        child: GestureDetector(onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: ListView(
          children: [
            Center(
              child: Stack(
                children: [
                  Container(

                    width: 130,
                    height: 130,
                    decoration: BoxDecoration(
                      border: Border.all(width: 4, color: Colors.white),
                      boxShadow: [
                        BoxShadow(
                          spreadRadius: 2,
                          blurRadius: 10,
                          color: Colors.black.withOpacity(0.1)
                        ) 
                      ],
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          "https://cdn.pixabay.com/photo/2023/07/05/04/45/european-shorthair-8107433_1280.jpg",

                        ))
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        shape:BoxShape.circle,
                        border:
                         Border.all(
                          width: 4,
                          color: Colors.white
                        ),
                        color: Colors.blue
                      ),
                      child: Icon(
                        Icons.edit,
                        color: Colors.white,
                      ),
                    ))
                ],
               ),
            ),
            SizedBox(
              height: 30,
            ),
            //appel function
            buildTextField("Full Name","Demon", false),
            buildTextField("Email","damo@gmail.com ", false),
            buildTextField("Password","*********", true),
            buildTextField("Location","Sfax", false),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlinedButton(onPressed: () {},
                 child: Text("Cancel",
                 style: TextStyle(
                  fontSize: 15,
                  letterSpacing: 2,
                  color: Colors.black
                 )),
                 style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)))
                 ),
                 ElevatedButton(onPressed: () {},
                  child: Text("SAVE", style: TextStyle(
                    fontSize: 15,
                    letterSpacing: 2,
                    color: Colors.white
                  ),),
                  style: ElevatedButton.styleFrom(
                    primary:  Colors.blue,
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))

                  ),)
              ],
            )

          ],
        ),),
      ),
    );
  }

  Widget buildTextField(String labelText, 
  String placeholder, 
  bool isPasswordTextField){
    return Padding(
      padding: EdgeInsets.only(bottom: 30),
      child: TextField(
        obscureText: isPasswordTextField ? isObscurePassword : false,
        decoration: InputDecoration(
          suffixIcon: isPasswordTextField ?
          IconButton(
            onPressed: () {
              //show and disable pwd
              setState(() {
                isObscurePassword = !isObscurePassword;
              });
            }, 
          icon: Icon(Icons.remove_red_eye, color: Colors.grey))
          : null,
          contentPadding: EdgeInsets.only(bottom: 5),
          labelText: labelText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: placeholder,
          hintStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.grey
          )
        ),
      ),
    );

  }
}
