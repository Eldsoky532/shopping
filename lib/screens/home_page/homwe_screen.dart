import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:shopping/screens/main_screen.dart';

import '../../bloc/shop_layout/cubic/cubic.dart';
import '../../bloc/shop_layout/cubic/states.dart';
import '../setting_nav/setting.dart';
import '../signin/sign_in_screen.dart';
class HomeLayout extends StatelessWidget {
   HomeLayout({Key? key}) : super(key: key);
  String? s1,s2;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create:(BuildContext context)=>ShopCubit(),
      child: BlocConsumer<ShopCubit,ShopStates>(
        listener: (context , state){
          if(state is ShoppingnavInitialState)
            {

            }
          if(state is Shoppingsignup)
            {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HomeScreen()),
              );

            }
        },
        builder: (context , state){

          var cubit=ShopCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.orange,
              title: Text('Shopping',style: TextStyle(
                  color: Colors.black45
              ),),
            ),
            body: cubit.screens[cubit.currentindex],
             bottomNavigationBar: BottomNavigationBar(
               currentIndex: cubit.currentindex,
                onTap: (index){
                 cubit.changeBottomNav(index);
                },
                backgroundColor: Colors.white,
                iconSize: 20.0,
                unselectedItemColor: Colors.grey,
                unselectedFontSize: 9.0,
                selectedFontSize: 9.0,
                type: BottomNavigationBarType.fixed,
                fixedColor: Colors.orange,

                items: [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      activeIcon: Icon(Icons.home),
                      label: 'Home'
                  ),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.category),
                      activeIcon: Icon(Icons.category),
                      label: 'Category'

                  ),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.favorite),
                      activeIcon: Icon(Icons.favorite),
                      label: 'favorite'

                  ),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.settings),
                      activeIcon: Icon(Icons.settings),
                      label: 'Setting'

                  )
                ],
              ),
            drawer: Drawer(
              child: ListView(
                children: [
                  Container(
                    child: UserAccountsDrawerHeader (
                      accountName: Text(''),
                      accountEmail:Text(''),
                      currentAccountPicture: Icon(Icons.shopping_cart_outlined,size: 60,color: Colors.white,),

                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.people), title: Text("Profile"),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SettingScreen()),
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.sign_language), title: Text("SignUp"),
                    onTap: () {

                      cubit.signup();


                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }


}



