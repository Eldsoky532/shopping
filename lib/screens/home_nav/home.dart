import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping/models/shop_model/shop_model.dart';

import '../../bloc/shop_layout/cubic/cubic.dart';
import '../../bloc/shop_layout/cubic/states.dart';
import '../../models/data_model.dart';

class HomeNavScreen extends StatelessWidget {
  const HomeNavScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ShopCubit()
        ..gethomedata()
        ..getProductsCategory(),
      child: BlocConsumer<ShopCubit, ShopStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return ConditionalBuilder(
            condition: ShopCubit.get(context).homeModel != null && ShopCubit.get(context).categoriesModel!=null,
            builder: (context) => getbanners(ShopCubit.get(context).homeModel!,
                ShopCubit.get(context).categoriesModel!, context),
            fallback: (context) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Loading......',
                    style: TextStyle(
                        color: Colors.red.shade900,
                        fontFamily: 'candy',
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget getbanners(HomeModel model, CategoriesModel categoriesModel, context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          CarouselSlider(
            items: model.data?.banners
                .map((e) => Image(
                      image: NetworkImage('${e.image!}'),
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ))
                .toList(),
            options: CarouselOptions(
              disableCenter: true,
              height: 230,
              initialPage: 0,
              viewportFraction: 1.0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(seconds: 1),
              autoPlayCurve: Curves.fastOutSlowIn,
              scrollDirection: Axis.horizontal,
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    'Categories',
                    style: TextStyle(
                      fontFamily: 'candy',
                      fontWeight: FontWeight.normal,
                      fontSize: 25,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  color: Colors.grey.shade100,
                  width: double.infinity,
                  height: 100,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) => buildCategories(
                          ShopCubit.get(context)
                              .categoriesModel!
                              .data!
                              .data[index]),
                      separatorBuilder: (context, index) => SizedBox(
                            width: 10,
                          ),
                      itemCount: categoriesModel.data!.data.length),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    'New Products',
                    style: TextStyle(
                      fontFamily: 'candy',
                      fontWeight: FontWeight.normal,
                      fontSize: 25,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  color: Colors.grey.shade300,
                  child: GridView.count(
                    crossAxisCount: 2,
                    reverse: false,
                    physics: NeverScrollableScrollPhysics(),
                    crossAxisSpacing: 1,
                    mainAxisSpacing: 1,
                    childAspectRatio: 1 / 1.52,
                    shrinkWrap: true,
                    children: List.generate(
                        model.data!.products.length,
                        (index) => buildGridViewProducts(
                            model.data!.products[index], context)),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCategories(DataModel model) => Stack(
        alignment: AlignmentDirectional.bottomStart,
        children: [
          Container(
            width: 100,
            height: 100,
            child: Image(
              image: NetworkImage('${model.image}'),
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: 100,
            height: 20,
            color: Colors.orange.withOpacity(0.8),
            child: Text(
              '${model.name}',
              textAlign: TextAlign.center,
              maxLines: 1,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 15,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      );

  Widget buildGridViewProducts(ProductModel model, context) => Container(
        color: Colors.white,
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                Image(
                  image: NetworkImage('${model.image}'),
                  height: 200,
                ),
                if (model.discount != 0)
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    color: Colors.red.shade900,
                    child: Text(
                      'Discount',
                      style: TextStyle(
                          fontSize: 12,
                          overflow: TextOverflow.ellipsis,
                          fontFamily: 'candy',
                          fontWeight: FontWeight.normal,
                          color: Colors.white),
                    ),
                  )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${model.name}',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        overflow: TextOverflow.ellipsis,
                        height: 1.4),
                    maxLines: 2,
                  ),
                  Row(
                    children: [
                      Text(
                        '${model.price}',
                        style: TextStyle(
                          color: Colors.red.shade900,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                        maxLines: 1,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      if (model.discount != 0)
                        Text(
                          '${model.old_price}',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                              decoration: TextDecoration.lineThrough),
                          maxLines: 1,
                        ),
                      Spacer(),
                      IconButton(
                        onPressed: () {
                          //ShopCubit.get(context).ChangeFavourites(model.id!);
                        },
                        icon: CircleAvatar(
                          //backgroundColor: ShopCubit.get(context).favourites[model.id]! ?  Colors.grey : Colors.red.shade900 ,

                          child: Icon(
                            Icons.favorite_border_outlined,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      );
}
