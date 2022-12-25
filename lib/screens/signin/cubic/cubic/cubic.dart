import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping/screens/signin/cubic/state/state.dart';

class ShoppingloginCubic extends Cubit<ShoppingLoginStates>
{
  ShoppingloginCubic() : super(ShoppingLoginInitialState());

  static ShoppingloginCubic get(context) => BlocProvider.of(context);


  void userLogin ({
    required String email,
    required String password,
})
  {

    emit(ShoppingLoginLoadingState());

    FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password).then((value) {
      print('Log in Success');
      emit(ShoppingLoginSuccessState());

    }).catchError((error){
      emit(ShoppingLoginErrorState(error));
    });

  }








}
