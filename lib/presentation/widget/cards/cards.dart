import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodhub/presentation/screens/home/food_details_screen/food_details_screen.dart';
import 'package:foodhub/presentation/widget/buttons/favorite_botton.dart';
import 'package:foodhub/service/food_api/api.dart';
import 'package:shimmer/shimmer.dart';

class BigCards extends ConsumerWidget {
  final int recipeCount;

  const BigCards({Key? key, required this.recipeCount}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recipesData = ref.watch(recipesProvider(recipeCount));

    return SizedBox(
      height: 329,
      child: recipesData.when(
        data: (recipes) {
          return LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
            return ListView.separated(
              padding: const EdgeInsets.only(right: 30),
              scrollDirection: Axis.horizontal,
              itemCount: recipes.length,
              itemBuilder: (
                BuildContext context,
                int index,
              ) {
                return GestureDetector(
                  onTap: () {
                    final selectedItem = recipes[index];
                    ref
                        .read(selectedRecipeProvider.notifier)
                        .setSelectedRecipe(selectedItem);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FoodDetailsScreen(
                                  heroTag: 'foodImage_${recipes[index].idMeal}',
                                )));
                  },
                  child: Stack(
                    children: [
                      Material(
                          borderRadius: BorderRadius.circular(25),
                          clipBehavior: Clip.antiAlias,
                          child: Container(
                            height: 319,
                            width: 370,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Theme.of(context).hoverColor,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.8),
                                  offset: Offset(4.0, 4.0),
                                  blurRadius: 15.0,
                                  spreadRadius: 1.0,
                                ),
                                BoxShadow(
                                  color: Color(0xffFFFFFFF),
                                  offset: Offset(-4.0, -4.0),
                                  blurRadius: 15.0,
                                  spreadRadius: 1.0,
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(25),
                              child: Hero(
                                tag: 'foodImage_${recipes[index].idMeal}',
                                child: CachedNetworkImage(
                                  imageUrl: recipes[index].strMealThumb,
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) =>
                                      Shimmer.fromColors(
                                    baseColor: Colors.grey[300]!,
                                    highlightColor: Colors.grey[100]!,
                                    child: Container(
                                      color: Colors.white,
                                    ),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                ),
                              ),
                            ),
                          )),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 200,
                        ),
                        child: Container(
                          height: 120,
                          width: 370,
                          decoration: BoxDecoration(
                            color: Color(0xffFFFFFF),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(25),
                              bottomRight: Radius.circular(25),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 210,
                          left: constraints.maxWidth * 0.043,
                        ),
                        child: Container(
                          width: 330,
                          child: Row(
                            children: [
                              Flexible(
                                child: Text(
                                  recipes[index].strMeal,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontFamily: 'Sofia Pro',
                                    color: Color(0xff000000),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: constraints.maxWidth * 0.016,
                                ),
                                child: Image.asset('assets/check.png'),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 240,
                          left: constraints.maxWidth * 0.043,
                        ),
                        child: Row(
                          children: [
                            Row(
                              children: [
                                Image.asset('assets/bike.png'),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: constraints.maxWidth * 0.016,
                                  ),
                                  child: Text(
                                    'Free delivery',
                                    style: const TextStyle(
                                        fontFamily: 'Sofia Pro',
                                        color: Color(0xff7E8392),
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: constraints.maxWidth * 0.043,
                              ),
                              child: Row(
                                children: [
                                  Image.asset('assets/time.png'),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: constraints.maxWidth * 0.016,
                                    ),
                                    child: Text(
                                      '10-15 mins',
                                      style: const TextStyle(
                                          fontFamily: 'Sofia Pro',
                                          color: Color(0xff7E8392),
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 270,
                          left: constraints.maxWidth * 0.043,
                        ),
                        child: Row(
                          children: [
                            Container(
                              height: 35,
                              width: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Color(0xffF6F6F6),
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(
                                  top: 8,
                                  left: constraints.maxWidth * 0.043,
                                ),
                                child: Text(
                                  maxLines: 1,
                                  recipes[index].strCategory,
                                  style: const TextStyle(
                                      fontFamily: 'Sofia Pro',
                                      color: Color(0xff8A8E9B),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: constraints.maxWidth * 0.043,
                              ),
                              child: Container(
                                height: 35,
                                width: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Color(0xffF6F6F6),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    top: 8,
                                    left: constraints.maxWidth * 0.030,
                                  ),
                                  child: Text(
                                    maxLines: 1,
                                    recipes[index].strArea,
                                    style: const TextStyle(
                                        fontFamily: 'Sofia Pro',
                                        color: Color(0xff8A8E9B),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: constraints.maxWidth * 0.043,
                              ),
                              child: Container(
                                height: 35,
                                width: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Color(0xffF6F6F6),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    top: 8,
                                    left: constraints.maxWidth * 0.030,
                                  ),
                                  child: Text(
                                    maxLines: 1,
                                    recipes[index].strArea,
                                    style: const TextStyle(
                                        fontFamily: 'Sofia Pro',
                                        color: Color(0xff8A8E9B),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              top: 20,
                              left: constraints.maxWidth * 0.043,
                            ),
                            child: Container(
                              height: 41,
                              width: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Color(0xffFFFFFF),
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: constraints.maxWidth * 0.020,
                                    ),
                                    child: Text(
                                      maxLines: 1,
                                      '4.5',
                                      style: const TextStyle(
                                          fontFamily: 'Sofia Pro',
                                          color: Color(0xff000000),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  Transform.translate(
                                    offset: Offset(3, -2),
                                    child: Icon(
                                      CupertinoIcons.star_fill,
                                      size: 14,
                                      color: Color(0xffFFBC58),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 5),
                                    child: Transform.translate(
                                      offset: Offset(3, -2),
                                      child: Text(
                                        '(80+)',
                                        maxLines: 1,
                                        style: const TextStyle(
                                          fontFamily: 'Sofia Pro',
                                          color: Color(0xffB3B3B3),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: constraints.maxWidth * 0.37,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: 25,
                              left: constraints.maxWidth * 0.043,
                            ),
                            child: FavoriteButton(onTap: (isActive) {
                              print(
                                  'Switch 1 is ${isActive ? 'Active' : 'Inactive'}');
                            }),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  width: 20,
                );
              },
            );
          });
        },
        loading: () => Center(
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (
                BuildContext context,
                int index,
              ) {
                return Material(
                  borderRadius: BorderRadius.circular(25),
                  clipBehavior: Clip.antiAlias,
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      height: 100,
                      width: 370,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.white),
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  width: 20,
                );
              },
              itemCount: 4),
        ),
        error: (error, stackTrace) => Text(error.toString()),
      ),
    );
  }
}
