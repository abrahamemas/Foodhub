import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodhub/presentation/screens/home/cart/cart.dart';
import 'package:foodhub/presentation/screens/home/home_screen/home_screen.dart';
import 'package:foodhub/presentation/widget/buttons/favorite_botton.dart';
import 'package:foodhub/presentation/widget/buttons/select_botton.dart';
import 'package:foodhub/service/food_api/api.dart';
import 'package:shimmer/shimmer.dart';

class FoodDetailsScreen extends ConsumerStatefulWidget {
  final String heroTag;

  const FoodDetailsScreen({Key? key, required this.heroTag}) : super(key: key);

  @override
  _FoodDetailsScreenState createState() => _FoodDetailsScreenState();
}

class _FoodDetailsScreenState extends ConsumerState<FoodDetailsScreen> {
  int itemCount = 1;
  double price = 9.50;

  void increment() {
    setState(() {
      itemCount++;
      price += 9.50;
    });
  }

  void decrement() {
    setState(() {
      if (itemCount > 1) {
        itemCount--;
        price -= 9.50;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final selectedRecipe = ref.watch(selectedRecipeProvider);

    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Scaffold(
        body: selectedRecipe != null
            ? Scaffold(
                backgroundColor: Color(0xffFBFBFB),
                body: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20, top: 40),
                            child: Hero(
                              tag: widget.heroTag,
                              child: Container(
                                height: 280,
                                width: 440,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Theme.of(context).hoverColor,
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: CachedNetworkImage(
                                    imageUrl: selectedRecipe.strMealThumb,
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
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  top: constraints.maxHeight * 0.058,
                                  left: constraints.maxWidth * 0.068,
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
                                      elevation: 0,
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
                                                    builder: (context) =>
                                                        HomeScreen()),
                                              );
                                            },
                                            icon: Icon(
                                              Icons.arrow_back_ios_new_rounded,
                                              size: 20,
                                              color: Color(0xff111719),
                                            ))),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: constraints.maxWidth * 0.60,
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  top: 50,
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
                      Padding(
                        padding: const EdgeInsets.only(top: 30, left: 25),
                        child: Text(
                          selectedRecipe.strMeal,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontFamily: 'Sofia Pro',
                            color: Color(0xff323643),
                            fontSize: 40,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 10,
                          left: constraints.maxWidth * 0.058,
                        ),
                        child: Row(
                          children: [
                            Transform.translate(
                              offset: Offset(2, -2),
                              child: Icon(
                                CupertinoIcons.star_fill,
                                size: 19,
                                color: Color(0xffFFBC58),
                              ),
                            ),
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
                            Padding(
                              padding: EdgeInsets.only(left: 5),
                              child: Text(
                                '(30+)',
                                maxLines: 1,
                                style: const TextStyle(
                                  fontFamily: 'Sofia Pro',
                                  color: Color(0xffB3B3B3),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: constraints.maxWidth * 0.025),
                              child: Row(
                                children: [
                                  Text(
                                    'See Review',
                                    style: TextStyle(
                                      fontFamily: 'Sofia Pro',
                                      color: Color(0xffFE724C),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Transform.translate(
                                    offset: Offset(0, -1),
                                    child: Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      color: Color(0xffFE724C),
                                      size: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 20, left: 25),
                            child: Text(
                              '\$',
                              style: const TextStyle(
                                fontFamily: 'Sofia Pro',
                                color: Color(0xffFE724C),
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15, left: 2),
                            child: Text(
                              price.toStringAsFixed(2),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontFamily: 'Sofia Pro',
                                color: Color(0xffFE724C),
                                fontSize: 38,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: decrement,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(top: 15, left: 200),
                              child: Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Color(0xffFFFFFF),
                                  borderRadius: BorderRadius.circular(35),
                                  border: Border.all(
                                    color: Color(0xffFE724C),
                                    width: 1.8,
                                  ),
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.remove,
                                    size: 24,
                                    color: Color(0xffFE724C),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15, left: 15),
                            child: Text(
                              itemCount.toString().padLeft(2, '0'),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontFamily: 'Sofia Pro',
                                color: Color(0xff000000),
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: increment,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 15, left: 15),
                              child: Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Color(0xffFE724C),
                                  borderRadius: BorderRadius.circular(35),
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.add,
                                    size: 24,
                                    color: Color(0xffFFFFFF),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 15, left: 25),
                        child: Container(
                          width: 500,
                          child: Text(
                            maxLines: 7,
                            overflow: TextOverflow.ellipsis,
                            selectedRecipe.strInstructions,
                            style: const TextStyle(
                              fontFamily: 'Sofia Pro',
                              color: Color(0xff858992),
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20, left: 25),
                        child: Text(
                          'Choice of Add On',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontFamily: 'Sofia Pro',
                            color: Color(0xff323643),
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 25),
                                  child: Image.asset('assets/image8.png'),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Text(
                                    'Pepper  Julienned',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontFamily: 'Sofia Pro',
                                      color: Color(0xff323643),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 100),
                                  child: Text(
                                    '+\$2.30',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontFamily: 'Sofia Pro',
                                      color: Color(0xff323643),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: SelectBotton(
                                    onTap: (isActive) {
                                      print(
                                          'Switch 1 is ${isActive ? 'Active' : 'Inactive'}');
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 25),
                                  child: Image.asset('assets/image9.png'),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Text(
                                    'Baby Spinach',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontFamily: 'Sofia Pro',
                                      color: Color(0xff323643),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 130),
                                  child: Text(
                                    '+\$4.70',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontFamily: 'Sofia Pro',
                                      color: Color(0xff323643),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: SelectBotton(
                                    onTap: (isActive) {
                                      print(
                                          'Switch 1 is ${isActive ? 'Active' : 'Inactive'}');
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 25),
                                  child: Image.asset('assets/image10.png'),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Text(
                                    'Masroom',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontFamily: 'Sofia Pro',
                                      color: Color(0xff323643),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 165),
                                  child: Text(
                                    '+\$2.50',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontFamily: 'Sofia Pro',
                                      color: Color(0xff323643),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: SelectBotton(
                                    onTap: (isActive) {
                                      print(
                                          'Switch 1 is ${isActive ? 'Active' : 'Inactive'}');
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Center(
                          child: Container(
                              height: 63,
                              width: constraints.maxWidth * 0.4050,
                              child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Cart()),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xffFE724C),
                                    shadowColor: Color(0xffFFFFFF),
                                    elevation: 5,
                                    surfaceTintColor: Color(0xffFFFFFF),
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 10,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(35),
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 40,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          color: Color(0xffFFFFFF),
                                          borderRadius:
                                              BorderRadius.circular(35),
                                        ),
                                        child:
                                            Image.asset('assets/image11.png'),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          top: 5,
                                          left: constraints.maxWidth * 0.026,
                                        ),
                                        child: Text(
                                          'ADD TO CART ',
                                          style: TextStyle(
                                            color: Color(0xffFFFFFF),
                                            fontSize: 16,
                                            fontFamily: 'Sofia Pro',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      )
                                    ],
                                  ))),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : Center(
                child: Text('No recipe selected'),
              ),
      );
    });
  }
}
