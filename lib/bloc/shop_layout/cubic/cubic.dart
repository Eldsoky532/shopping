import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping/bloc/shop_layout/cubic/states.dart';
import 'package:shopping/models/shop_model/shop_model.dart';
import 'package:shopping/models/shop_model/shop_model.dart';
import 'package:shopping/network/Dio.dart';
import 'package:shopping/network/constant.dart';

import '../../../../screens/category_nav/cat_nav.dart';
import '../../../../screens/fav_nav/favourite.dart';
import '../../../../screens/home_nav/home.dart';
import '../../../../screens/setting_nav/setting.dart';
import '../../../models/data_model.dart';
import '../../../models/usermodel.dart';


class ShopCubit extends Cubit<ShopStates> {

  ShopCubit() :super (ShopInitialState());

  static ShopCubit get(context) => BlocProvider.of(context);
  int currentindex=0;
  ShoppingUserModel? shoppingUserModel;

  List<Widget> screens=[
    HomeNavScreen(),
    CategoryScreen(),
    SettingScreen(),
  ];

  void changeBottomNav(int index) {
    currentindex = index;
    emit(ShoppingchangeBottomNav());
  }
  void signup() async
  {
    await FirebaseAuth.instance.signOut();
    emit(Shoppingsignup());

  }

  HomeModel? homeModel;

  void gethomedata()
  {
    emit(ShopLoadingHomeDataState());
    HttpClient()..idleTimeout = const Duration(seconds: 20);

     DioHelper.getData(
        url:Home
    ).then((value){
      homeModel=HomeModel.fromJson(value!.data);
      /*homeModel!.data!.products.forEach((element) {
        Fav  element.id!:element!.in_favorites;
      });*/
      emit(ShopSucessHomeDataState());
    }).catchError((error){
      emit(ShopErrorHomeDataState());

      print(error.toString());
    });





  }
  CategoriesModel? categoriesModel;

  void getProductsCategory(){

    emit(ShopLoadingCategoriesState());

    DioHelper.getData(url: 'categories').then((value){

      categoriesModel=CategoriesModel.fromJson(value.data);

      emit(ShopSuccessCategoriesState());

    }).catchError((error){

      print(error);

      emit(ShopErrorCategoriesState(error));

    });

  }




  }




