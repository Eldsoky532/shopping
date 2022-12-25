import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping/models/usermodel.dart';
import 'package:shopping/screens/sign_up/cubit/states.dart';

class ShoppingRegcubit extends Cubit<ShoppingRegisiterStates>
{
  ShoppingRegcubit():super(ShoppingRegisInitialState());

  static ShoppingRegcubit get(context) => BlocProvider.of(context);



  void userRegister({
  required String name,
    required String phone,
    required String email,
    required String password
})
  {
    emit(ShoppingRegisloadingState());
    FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password).then((value){
      print('sign up sucess');
      usercreated(name: name, phone: phone, email: email, password: password, uid: value.user!.uid);

    }).catchError((error){
      print(error.toString());
      emit(ShoppingRegisErrorState(error));
    });




  }



  void usercreated({
    required String name,
    required String phone,
    required String email,
    required String password,
    required String uid
  })
  {
    ShoppingUserModel userModel=new ShoppingUserModel(name: name, phone: phone, email: email, password: password, uid: uid);
     FirebaseFirestore.instance.collection('user').doc(uid).set(userModel.toMap()).then((value){
       emit(ShoppingRegisSucessState());
     }).catchError((error){
       emit(ShoppingRegisErrorState(error));
     });

  }





}

