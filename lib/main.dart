import 'dart:ui';
import 'package:flutter/material.dart';
import 'catalogue.dart';
import 'package:dio/dio.dart';
import 'User.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Sign up'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Dio dio=Dio();
   login(String email,String mdp) async {
final response= await dio.post(
  '/api/auth/login',
  data: {
    'email':email,
    'mdp':mdp
  }

);
print(response.statusCode);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,

        margin: EdgeInsets.all(10),
        color: Colors.black,
        child: Center(child: Form(

          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    child: TextFormField(
                      style: TextStyle(color: Colors.white),
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          labelText: "votre nom",
                          filled: false,
                          icon: Icon(Icons.person),
                          iconColor: Colors.white,
                          labelStyle: TextStyle(color: Colors.white),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              gapPadding: double.minPositive,
                              borderSide: BorderSide(
                                color: Colors.white,
                                style: BorderStyle.solid,
                                width: 5,
                              ))),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: TextFormField(
                      style: TextStyle(color: Colors.white),
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      decoration: InputDecoration(
                          labelText: "Mot de passe",
                          filled: true,
                          icon: Icon(Icons.password),
                          iconColor: Colors.white,
                          
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          labelStyle: TextStyle(color: Colors.white),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              gapPadding: double.minPositive,
                              borderSide: BorderSide(
                                color: Colors.white,
                                style: BorderStyle.solid,
                                width: 5,
                              ))),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> Catalogue()));
                        print('coucou');
                      },
                      child: Text(
                        "S'incrire",
                        style: TextStyle(color: Colors.black),
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          side: BorderSide(
                            color: Colors.white,
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ),

        ),)
      ),
    );
  }
}
