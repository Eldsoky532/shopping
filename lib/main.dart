import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shopping/bloc/shop_layout/cubic/cubic.dart';
import 'package:shopping/screens/home_nav/home.dart';
import 'package:shopping/screens/main_screen.dart';
import 'package:shopping/screens/sign_up/sign_up_screen.dart';

import 'network/Dio.dart';

void main()async {
  runApp(const MyApp());
  await Firebase.initializeApp(
  );
  await DioHelper.init();
  Widget widget;

  var uid=FirebaseAuth.instance.currentUser!.uid;

  if(uid!=null)
    {
      widget=HomeNavScreen();
    }else
      {
        widget=HomeScreen();
      }

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.orange,
      ),
      home:HomeScreen(),
    );
  }

}


