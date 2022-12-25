import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping/models/usermodel.dart';
import 'package:shopping/screens/setting_nav/cubit/states.dart';

class SetttingCubic extends Cubit<SettingState> {
  SetttingCubic() :super(SettingIntial());

  static SetttingCubic get(context) => BlocProvider.of(context);


  ShoppingUserModel? userModel;


  Future <void> getdate() async
  {
    emit(Settingloading());

    await FirebaseFirestore.instance.collection('user').doc(
        FirebaseAuth.instance.currentUser!.uid).get().then((value) {
      print(value.data());
      userModel = ShoppingUserModel.fromJson(value.data()!);
      emit(Settingsucess());
    }).catchError((error) {
      emit(Settingerror(error));
    });
  }

  Future<void> updadate({
   required String name,
   required String phone,
    required String email,
   required String password,
  })async {

    emit(Settingupdateloading());
    ShoppingUserModel model=ShoppingUserModel(
      name: name,
      phone: phone,
      email: email,
      password: password,
      uid: FirebaseAuth.instance.currentUser!.uid
    );



   await FirebaseFirestore.instance.collection('user')
    .doc(FirebaseAuth.instance.currentUser!.uid)
    .update(model.toMap())
    .then((value){
      getdate();

      emit(Settingupdatesucess());


    }).catchError((error){
      emit(Settingupdateerror(error));
    });


  }


}