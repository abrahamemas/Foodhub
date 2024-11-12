import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:foodhub/presentation/screens/home/food_details_screen/food_details_screen.dart';
import 'package:foodhub/presentation/widget/buttons/favorite_botton.dart';
import 'package:foodhub/service/food_api/api.dart';
import 'package:shimmer/shimmer.dart';

class SmallCard extends ConsumerWidget {
  final int recipeCount;

  const SmallCard({Key? key, required this.recipeCount}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recipesData = ref.watch(recipesProvider(recipeCount));

    return recipesData.when(
      data: (recipes) {
        return SingleChildScrollView(
          child: Column(
            children: [
              StaggeredGridView.countBuilder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                itemCount: recipes.length,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                staggeredTileBuilder: (index) => StaggeredTile.fit(1),
                itemBuilder: (BuildContext context, int index) {
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
                            heroTag: 'smallCardHero-${recipes[index].idMeal}',
                          ),
                        ),
                      );
                    },
                    child: Stack(
                      children: [
                        Material(
                          borderRadius: BorderRadius.circular(25),
                          clipBehavior: Clip.antiAlias,
                          child: Container(
                            height: 300,
                            width: 220,
                            decoration: BoxDecoration(
                              color: Color(0xffFFFFFF),
                              borderRadius: BorderRadius.circular(25),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xff67666D),
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
                          ),
                        ),
                        Material(
                          borderRadius: BorderRadius.circular(25),
                          clipBehavior: Clip.antiAlias,
                          child: Container(
                            height: 220,
                            width: 220,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Theme.of(context).hoverColor,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(25),
                              child: Hero(
                                tag: 'smallCardHero-${recipes[index].idMeal}',
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
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 245, left: 15),
                          child: Container(
                            width: 200,
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
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 270, left: 15),
                          child: Container(
                            width: 180,
                            child: Text(
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              recipes[index].strInstructions,
                              style: const TextStyle(
                                fontFamily: 'Sofia Pro',
                                color: Color(0xff7E8392),
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 200, left: 10),
                          child: Material(
                            shadowColor: Color(0xffFE724C),
                            borderRadius: BorderRadius.circular(20),
                            clipBehavior: Clip.antiAlias,
                            child: Container(
                              height: 41,
                              width: 110,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Color(0xffFFFFFF),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.30),
                                      offset: Offset(4.0, 4.0),
                                      blurRadius: 15.0,
                                      spreadRadius: 1.0,
                                    ),
                                    BoxShadow(
                                      color: Colors.black,
                                      offset: Offset(-8.0, -8.0),
                                      blurRadius: 30.0,
                                      spreadRadius: 8.0,
                                    ),
                                  ]),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 14),
                                    child: Text(
                                      '4.5',
                                      maxLines: 1,
                                      style: const TextStyle(
                                        fontFamily: 'Sofia Pro',
                                        color: Color(0xff000000),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  Transform.translate(
                                    offset: Offset(2, -2),
                                    child: Image.asset('assets/rating.png'),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 5),
                                    child: Text(
                                      '(99+)',
                                      maxLines: 1,
                                      style: const TextStyle(
                                        fontFamily: 'Sofia Pro',
                                        color: Color(0xffB3B3B3),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 15, left: 10),
                              child: Container(
                                height: 40,
                                width: 90,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Color(0xffFFFFFF),
                                ),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.only(top: 10, left: 10),
                                      child: Text(
                                        '\$',
                                        style: const TextStyle(
                                          fontFamily: 'Sofia Pro',
                                          color: Color(0xffFE724C),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      '8.25',
                                      style: const TextStyle(
                                        fontFamily: 'Sofia Pro',
                                        color: Color(0xff000000),
                                        fontSize: 30,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 15, left: 45),
                              child: FavoriteButton(
                                onTap: (isActive) {
                                  print(
                                      'Switch 1 is ${isActive ? 'Active' : 'Inactive'}');
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
      error: (err, stackTrace) => Text(
        'Error: ${err.toString()}',
        style: TextStyle(color: Colors.red),
      ),
      loading: () => Center(
        child: SpinKitFadingCircle(
          color: Color(0xffFE724C),
        ),
      ),
    );
  }
}
