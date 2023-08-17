import 'dart:io';

import 'package:apitest/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(LoginUiApp());
}

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

class LoginUiApp extends StatelessWidget {
  Color _primaryColor = HexColor('#00D100');
  Color _cardColor = HexColor('#007500');

  // Color _primaryColor = HexColor('#DC54FE');
  // Color _cardColor = HexColor('#8A02AE');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login UI',
      theme: ThemeData(

        primaryColor: _primaryColor,
        cardColor: _cardColor,
        scaffoldBackgroundColor: Colors.grey.shade100,
        primarySwatch: Colors.grey,

      ),
      home: SplashScreen(title: 'Flutter Login UI'),
    );
  }
}

