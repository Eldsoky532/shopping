import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping/screens/home_page/homwe_screen.dart';
import 'package:shopping/screens/signin/cubic/cubic/cubic.dart';
import 'package:shopping/screens/signin/cubic/state/state.dart';

import '../../widget/component/component.dart';
import '../sign_up/sign_up_screen.dart';

class SigninScreen extends StatelessWidget {
  SigninScreen({Key? key}) : super(key: key);
  TextEditingController emailcontrollar = TextEditingController();
  TextEditingController passwordcontrollar = TextEditingController();
  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ShoppingloginCubic(),
      child: BlocConsumer<ShoppingloginCubic, ShoppingLoginStates>(
        listener: (context, state) async{
          if(state is ShoppingLoginSuccessState)
            {

              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HomeLayout()),
              );
            }

        },
        builder: (context, state) {
          return Scaffold(
            body: ListView(
              children: [
                Form(
                  key: formkey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(55.0),
                        child: Column(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.orange,
                              radius: 40,
                              child: Icon(
                                Icons.shopping_cart_outlined,
                                size: 40,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Product",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.orange,
                              ),
                              maxLines: 2,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Welcome to Log in ",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.normal,
                                color: Colors.black,
                              ),
                              maxLines: 2,
                            ),
                          ],
                        ),
                      ),
                      defaultTextField('Email', "Enter your Email",
                          Icon(Icons.email), emailcontrollar, (String value) {
                        if (value.isEmpty) {
                          return 'please enter your email';
                        }
                      }),
                      SizedBox(
                        height: 5,
                      ),
                      defaultTextField(
                          'Password',
                          "Enter your password",
                          Icon(Icons.password),
                          passwordcontrollar, (String value) {
                        if (value.isEmpty) {
                          return 'please enter your password';
                        }
                      }),
                      SizedBox(
                        height: 15,
                      ),
                      defaultbutton('Sign in', () {
                        if (formkey.currentState!.validate()) {
                          ShoppingloginCubic.get(context).userLogin(
                              email: emailcontrollar.text,
                              password: passwordcontrollar.text);
                        }
                      }),
                      SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: Text(
                          "OR ",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: Colors.orange,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 10, top: 10),
                            child: Text(
                              "Dont Have an Account ? ",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 1, right: 10, top: 8),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Screenup()),
                                );
                              },
                              child: Text(
                                "sign up ",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.orange,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

}
