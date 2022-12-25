import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping/screens/sign_up/sign_up_screen.dart';
import 'package:shopping/screens/signin/sign_in_screen.dart';
import 'package:shopping/widget/component/component.dart';

import '../models/usermodel.dart';
import 'home_page/homwe_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {
  String? s;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {


    });



  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        CircleAvatar(
           backgroundColor: Colors.orange,
          radius: 70,
          child: Icon(Icons.shopping_cart_outlined,size: 80,color: Colors.white,),
        ),
          SizedBox(height: 20,),
          Center(
            child: Text("Find High Quality Product",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color:Colors.orange,

              ),
              maxLines: 2,

            ),
          ),
         SizedBox(height: 80,),
         defaultbutton('Lets Go', (){
           Navigator.push(
             context,
             MaterialPageRoute(builder: (context) =>  Screenup()),
           );
         })
        ],
      ),
    );
  }


}
