import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping/screens/sign_up/cubit/cubic.dart';
import 'package:shopping/screens/sign_up/cubit/states.dart';
import 'package:shopping/screens/signin/sign_in_screen.dart';

import '../../widget/component/component.dart';
import '../home_page/homwe_screen.dart';

class Screenup extends StatelessWidget {
   Screenup({Key? key}) : super(key: key);

  TextEditingController namecontrollar=TextEditingController();
  TextEditingController phonecontrollar=TextEditingController();
  TextEditingController emailcontrollar=TextEditingController();
  TextEditingController passwordcontrollar=TextEditingController();
   var formkey = GlobalKey<FormState>();



   @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create:(BuildContext context)=>ShoppingRegcubit(),
      child: BlocConsumer<ShoppingRegcubit,ShoppingRegisiterStates>(
        listener: (context,state){
          if(state is ShoppingRegisSucessState)
          {

            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => HomeLayout()),
            );
          }
        },
        builder: (context,state){
          return Scaffold(
            body: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
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
                        "Create an Account ",
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
                  key:formkey ,
                  child: Column(
                    children: [
                      defaultTextField('Name',"Enter your name",Icon(Icons.supervised_user_circle_sharp),
                          namecontrollar,(String value){
                           if(value.isEmpty)
                             {
                               return 'please enter your  Name';

                             }
                          }
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      defaultTextField('Phone',"Enter your Phone",Icon(Icons.phone),
                          phonecontrollar,(String value){
                            if(value.isEmpty)
                            {
                              return 'please enter your  phone';

                            }
                          }

                      ),
                      SizedBox(
                        height: 5,
                      ),
                      defaultTextField('Email',"Enter your Email",Icon(Icons.email),
                          emailcontrollar,(String value){
                            if(value.isEmpty)
                            {
                              return 'please enter your email';

                            }
                          }
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      defaultTextField('Password',"Enter your password",Icon(Icons.password),
                          passwordcontrollar,(String value){
                            if(value.isEmpty)
                            {
                              return 'please enter your password';

                            }
                          }
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      defaultbutton('Sign up', (){
                        if(formkey.currentState!.validate())
                          {
                            ShoppingRegcubit.get(context).userRegister(
                                name: namecontrollar.text,
                                phone: phonecontrollar.text,
                                email: emailcontrollar.text,
                                password: passwordcontrollar.text
                            );
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
                            padding: const EdgeInsets.only(left: 20, right: 10, top: 10),
                            child: Text(
                              "Already Have an Account ? ",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 1, right: 10, top: 8),
                            child: InkWell(
                              onTap: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) =>  SigninScreen()),
                                );
                              },
                              child: Text(
                                "sign in ",
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
