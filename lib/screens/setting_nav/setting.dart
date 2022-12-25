import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping/models/usermodel.dart';
import 'package:shopping/screens/setting_nav/cubit/cubic.dart';
import 'package:shopping/screens/setting_nav/cubit/states.dart';

import '../../widget/component/component.dart';

class SettingScreen extends StatelessWidget {
  SettingScreen({Key? key}) : super(key: key);

  TextEditingController namecontrollar = TextEditingController();
  TextEditingController phonecontrollar = TextEditingController();
  TextEditingController emailcontrollar = TextEditingController();
  TextEditingController passwordcontrollar = TextEditingController();
  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => SetttingCubic()..getdate(),
        child: BlocConsumer<SetttingCubic, SettingState>(
          listener: (context, state) {

          },
          builder: (context, state) {
            var cubic=SetttingCubic.get(context);
            var usermodel = SetttingCubic.get(context).userModel;
            return ConditionalBuilder(
              condition: usermodel != null,
              builder: (context) => Scaffold(
                body: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          SizedBox(height: 20),
                          CircleAvatar(
                            backgroundColor: Colors.orange,
                            radius: 30,
                            child: Icon(
                              Icons.shopping_cart_outlined,
                              size: 30,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Welcome to Profile ",
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
                    Form(
                      key: formkey,
                      child: Column(
                        children: [
                          defaultTextField(
                              'Name',
                              "${usermodel!.name}",
                              Icon(Icons.supervised_user_circle_sharp),
                              namecontrollar, (String value) {
                            if (value.isEmpty) {
                              return 'please enter your  Name';
                            }
                          }),
                          SizedBox(
                            height: 5,
                          ),
                          defaultTextField(
                              'Phone',
                              "${usermodel!.phone}",
                              Icon(Icons.phone),
                              phonecontrollar, (String value) {
                            if (value.isEmpty) {
                              return 'please enter your  phone';
                            }
                          }),
                          SizedBox(
                            height: 5,
                          ),
                          defaultTextField(
                              'Email',
                              "${usermodel!.email}",
                              Icon(Icons.email),
                              emailcontrollar, (String value) {
                            if (value.isEmpty) {
                              return 'please enter your email';
                            }
                          }),
                          SizedBox(
                            height: 5,
                          ),
                          defaultTextField(
                              'Password',
                              "${usermodel!.password}",
                              Icon(Icons.password),
                              passwordcontrollar, (String value) {
                            if (value.isEmpty) {
                              return 'please enter your password';
                            }
                          }),
                          SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: defaultbutton('Edit Profile', () {
                                    namecontrollar.text=usermodel.name!;
                                    phonecontrollar.text=usermodel.phone!;
                                    emailcontrollar.text=usermodel.email!;
                                    passwordcontrollar.text=usermodel.password!;

                                  }),
                                ),
                                SizedBox(width: 5,),
                                Expanded(
                                  child: defaultbutton('Save data', () {
                                    if(formkey.currentState!.validate())
                                      {
                                        cubic.updadate(name: namecontrollar.text, phone: phonecontrollar.text, email: emailcontrollar.text, password: passwordcontrollar.text);
                                      }
                                  }),
                                ),
                              ],
                            ),
                          )

                        ],
                      ),
                    )
                  ],
                ),
              ),
              fallback: (context) => Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.grey.shade400,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            );
          },
        ));
  }

}
