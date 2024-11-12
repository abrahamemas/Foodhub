import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodhub/presentation/screens/home/food_details_screen/food_details_screen.dart';
import 'package:foodhub/presentation/screens/home/home_screen/home_screen.dart';
import 'package:foodhub/presentation/widget/buttons/favorite_botton.dart';
import 'package:foodhub/service/food_api/api.dart';
import 'package:foodhub/service/food_api/category/burger_category/api.dart';
import 'package:foodhub/service/food_api/model.dart';
import 'package:shimmer/shimmer.dart';

class BurgerCategoryScreen extends ConsumerWidget {
  const BurgerCategoryScreen({Key? key, required this.recipeCount})
      : super(key: key);
  final String query = "Burgers";
  final int recipeCount;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(searchBurgerDataProvider(query));
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Scaffold(
          backgroundColor: Color(0xffFBFBFB),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: constraints.maxHeight * 0.050,
                        left: constraints.maxWidth * 0.040,
                      ),
                      child: Container(
                        height: 48,
                        width: constraints.maxWidth * 0.1000,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeScreen()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xffFFFFFF),
                            shadowColor: Color(0xffFFFFFF),
                            elevation: 5,
                            surfaceTintColor: Color(0xffFFFFFF),
                            padding: EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          child: Transform.translate(
                            offset: Offset(-4, 0),
                            child: IconButton(
                              onPressed: () {
                                Navigator.pop(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomeScreen()),
                                );
                              },
                              icon: Icon(
                                Icons.arrow_back_ios_new_rounded,
                                size: 20,
                                color: Color(0xff111719),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 100,
                        left: 100,
                      ),
                      child: Transform.translate(
                        offset: Offset(60, 0),
                        child: Image.asset(
                          'assets/image13.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 150,
                        left: constraints.maxWidth * 0.040,
                      ),
                      child: Text(
                        'Fast',
                        style: TextStyle(
                          fontFamily: 'Sofia Pro',
                          color: Color(0xff272D2F),
                          fontSize: 52,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ).animate().slide(duration: 1000.ms),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 215,
                        left: constraints.maxWidth * 0.040,
                      ),
                      child: Text(
                        'Food',
                        style: TextStyle(
                          fontFamily: 'Sofia Pro',
                          color: Color(0xffFE724C),
                          fontSize: 62,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ).animate().slide(duration: 1000.ms),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 300,
                        left: constraints.maxWidth * 0.042,
                      ),
                      child: Text(
                        '80 type of burgar',
                        style: TextStyle(
                          fontFamily: 'Sofia Pro',
                          color: Color(0xff9796A1),
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            top: 400,
                            left: constraints.maxWidth * 0.042,
                          ),
                          child: Text(
                            'Short by:',
                            style: TextStyle(
                              fontFamily: 'Sofia Pro',
                              color: Color(0xff111719),
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: 400,
                            left: constraints.maxWidth * 0.035,
                          ),
                          child: Text(
                            'Popular',
                            style: TextStyle(
                              fontFamily: 'Sofia Pro',
                              color: Color(0xffFE724C),
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: 400,
                            left: constraints.maxWidth * 0.010,
                          ),
                          child: Icon(
                            Icons.arrow_drop_down_sharp,
                            color: Color(0xff9796A1),
                            size: 30,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: 405,
                            left: constraints.maxWidth * 0.300,
                          ),
                          child: GestureDetector(
                            onTap: () {},
                            child: Container(
                              height: 23,
                              width: constraints.maxWidth * 0.1300,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xffFBFBFB),
                                    offset: Offset(4.0, 4.0),
                                    blurRadius: 15.0,
                                    spreadRadius: 1.0,
                                  ),
                                  BoxShadow(
                                    color: Color(0xffFBFBFB),
                                    offset: Offset(-4.0, -4.0),
                                    blurRadius: 15.0,
                                    spreadRadius: 1.0,
                                  ),
                                ],
                              ),
                              child: SvgPicture.asset(
                                'assets/cat.svg',
                                width: 12,
                                height: 12,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30, left: 30),
                  child: data.when(
                    data: (data) {
                      List<Recipe> recipe = data.map((e) => e).toList();
                      return Container(
                        height: constraints.maxHeight - 500,
                        child: ListView.separated(
                          padding: const EdgeInsets.only(right: 30),
                          scrollDirection: Axis.vertical,
                          itemCount: recipe.length,
                          itemBuilder: (BuildContext context, int index) {
                            final Recipe recipeItem = recipe[index];
                            return GestureDetector(
                              onTap: () {
                                ref
                                    .read(selectedRecipeProvider.notifier)
                                    .setSelectedRecipe(recipeItem);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => FoodDetailsScreen(
                                      heroTag:
                                          'pizzacategoryscreen_${recipeItem.idMeal}',
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
                                      height: 320,
                                      width: 423,
                                      decoration: BoxDecoration(
                                        color: const Color(0xffFFFFFF),
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(25),
                                          bottomRight: Radius.circular(25),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Material(
                                    borderRadius: BorderRadius.circular(25),
                                    clipBehavior: Clip.antiAlias,
                                    child: Container(
                                      height: 230,
                                      width: 423,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25),
                                        color: Theme.of(context).hoverColor,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.8),
                                            offset: const Offset(4.0, 4.0),
                                            blurRadius: 15.0,
                                            spreadRadius: 1.0,
                                          ),
                                          const BoxShadow(
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
                                          tag:
                                              'pizzacategoryscreen_${recipeItem.idMeal}',
                                          child: CachedNetworkImage(
                                            imageUrl: recipeItem.strMealThumb,
                                            fit: BoxFit.cover,
                                            placeholder: (context, url) =>
                                                Shimmer.fromColors(
                                              baseColor: Colors.grey[300]!,
                                              highlightColor: Colors.grey[100]!,
                                              child: Container(
                                                color: Colors.white,
                                              ),
                                            ),
                                            errorWidget:
                                                (context, url, error) =>
                                                    const Icon(Icons.error),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 260, left: 20),
                                    child: SizedBox(
                                      width: 400,
                                      child: Text(
                                        recipeItem.strMeal,
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
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 290, left: 20),
                                    child: SizedBox(
                                      width: 300,
                                      child: Text(
                                        recipeItem.strInstructions,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
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
                                    padding: const EdgeInsets.only(
                                        top: 210, left: 20),
                                    child: Material(
                                      shadowColor: const Color(0xffFE724C),
                                      borderRadius: BorderRadius.circular(20),
                                      clipBehavior: Clip.antiAlias,
                                      child: Container(
                                        height: 41,
                                        width: 110,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          color: const Color(0xffFFFFFF),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.30),
                                              offset: const Offset(4.0, 4.0),
                                              blurRadius: 15.0,
                                              spreadRadius: 1.0,
                                            ),
                                            const BoxShadow(
                                              color: Colors.black,
                                              offset: Offset(-8.0, -8.0),
                                              blurRadius: 30.0,
                                              spreadRadius: 8.0,
                                            ),
                                          ],
                                        ),
                                        child: Row(
                                          children: [
                                            const Padding(
                                              padding:
                                                  EdgeInsets.only(left: 14),
                                              child: Text(
                                                '4.5',
                                                maxLines: 1,
                                                style: TextStyle(
                                                  fontFamily: 'Sofia Pro',
                                                  color: Color(0xff000000),
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                            Transform.translate(
                                              offset: const Offset(2, -2),
                                              child: Image.asset(
                                                  'assets/rating.png'),
                                            ),
                                            const Padding(
                                              padding: EdgeInsets.only(left: 5),
                                              child: Text(
                                                '(99+)',
                                                maxLines: 1,
                                                style: TextStyle(
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
                                        padding: const EdgeInsets.only(
                                            top: 15, left: 20),
                                        child: Container(
                                          height: 55,
                                          width: 110,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            color: const Color(0xffFFFFFF),
                                          ),
                                          child: Row(
                                            children: const [
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(left: 8),
                                                child: Text(
                                                  '\$',
                                                  style: TextStyle(
                                                    fontFamily: 'Sofia Pro',
                                                    color: Color(0xffFE724C),
                                                    fontSize: 28,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(right: 3),
                                                child: Text(
                                                  '10.35',
                                                  style: TextStyle(
                                                    fontFamily: 'Sofia Pro',
                                                    color: Color(0xff000000),
                                                    fontSize: 30,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 15, left: 220),
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
                          separatorBuilder: (context, index) {
                            return SizedBox(height: 30);
                          },
                        ),
                      );
                    },
                    loading: () => Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Container(
                              height: 500,
                              child: ListView.separated(
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
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
                                          height: 180,
                                          width: 423,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                              color: Colors.white),
                                        ),
                                      ),
                                    );
                                  },
                                  separatorBuilder:
                                      (BuildContext context, int index) {
                                    return const SizedBox(
                                      height: 30,
                                    );
                                  },
                                  itemCount: 4),
                            ),
                          ),
                        ],
                      ),
                    ),
                    error: (err, stack) => Center(
                      child: Text(
                        'Error: ${err.toString()}',
                        style: const TextStyle(
                          color: Colors.red,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
