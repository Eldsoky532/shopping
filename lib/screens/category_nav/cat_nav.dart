import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping/bloc/shop_layout/cubic/cubic.dart';
import 'package:shopping/bloc/shop_layout/cubic/states.dart';

import '../../models/data_model.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>ShopCubit()..getProductsCategory(),
      child: BlocConsumer<ShopCubit,ShopStates>(
        listener: (context,state){},
        builder: (context,state){
         print('hahahahahha1');
          return ConditionalBuilder(
              condition:  ShopCubit.get(context).categoriesModel !=null ,
              builder: (context)=>ListView.separated(
                itemBuilder: (context, index) =>buildCatItem(ShopCubit.get(context).categoriesModel!.data!.data[index]) ,
                separatorBuilder: (context, index) =>Container(width:100, height: 1,color: Colors.grey,),
                itemCount: ShopCubit.get(context).categoriesModel!.data!.data.length,
              ),
              fallback: (context)=>Center(

                child: Column(

                  mainAxisAlignment:  MainAxisAlignment.center,

                  children: [



                    SizedBox(

                      height: 5,

                    ),

                    Text('Loading......',

                      style: TextStyle(

                          color: Colors.red.shade900,

                          fontFamily: 'candy',

                          fontWeight: FontWeight.bold

                      ),),

                  ],

                ),

              ),
          );
        },
      ),
    );
  }
  Widget buildCatItem(DataModel model) => Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children:
      [
        Image(
          image: NetworkImage('${model.image!}'),
          width: 80.0,
          height: 80.0,
          fit: BoxFit.cover,
        ),
        SizedBox(
          width: 20.0,
        ),
        Text(
          '${model.name!}',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        Spacer(),
        Icon(
          Icons.arrow_forward_ios,
        ),
      ],
    ),
  );
}

