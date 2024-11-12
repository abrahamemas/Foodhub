import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodhub/presentation/screens/home/home_screen/home_screen.dart';
import 'package:foodhub/service/food_api/api.dart';
import 'package:shimmer/shimmer.dart';

class Cart extends ConsumerStatefulWidget {
  const Cart({super.key});

  @override
  _CartState createState() => _CartState();
}

class _CartState extends ConsumerState<Cart> {
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
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: constraints.maxWidth * 0.05,
                          vertical: constraints.maxHeight * 0.05,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
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
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  shadowColor:
                                      Color.fromARGB(255, 205, 204, 204)
                                          .withOpacity(0.8),
                                  elevation: 5,
                                ),
                                child: Icon(
                                  Icons.arrow_back_ios_new_rounded,
                                  size: 20,
                                  color: Color(0xff111719),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: constraints.maxHeight * 0.005,
                                left: constraints.maxWidth * 0.280,
                              ),
                              child: Text(
                                'Cart',
                                maxLines: 1,
                                style: const TextStyle(
                                  fontFamily: 'Sofia Pro',
                                  color: Color(0xff323643),
                                  fontSize: 28,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 130,
                              width: 130,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(35),
                                color: Theme.of(context).hoverColor,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(35),
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
                            SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: Container(
                                          width: 200,
                                          child: Text(
                                            selectedRecipe.strMeal,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                              fontFamily: 'Sofia Pro',
                                              color: Color(0xff0000000),
                                              fontSize: 20,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 40),
                                        child: IconButton(
                                          color: Color(0xffFE724C),
                                          icon: Icon(Icons.close),
                                          onPressed: () {},
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 3),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Text(
                                      selectedRecipe.strCategory,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontFamily: 'Sofia Pro',
                                        color: Color(0xff858992),
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: Text(
                                          '\$',
                                          style: const TextStyle(
                                            fontFamily: 'Sofia Pro',
                                            color: Color(0xffFE724C),
                                            fontSize: 19,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        price.toStringAsFixed(2),
                                        style: const TextStyle(
                                          fontFamily: 'Sofia Pro',
                                          color: Color(0xffFE724C),
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Spacer(),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 2),
                                        child: GestureDetector(
                                          onTap: decrement,
                                          child: Container(
                                            width: 40,
                                            height: 40,
                                            decoration: BoxDecoration(
                                              color: Color(0xffFFFFFF),
                                              borderRadius:
                                                  BorderRadius.circular(35),
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
                                      SizedBox(width: 10),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 5),
                                        child: Text(
                                          itemCount.toString().padLeft(2, '0'),
                                          style: const TextStyle(
                                            fontFamily: 'Sofia Pro',
                                            color: Color(0xff000000),
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Padding(
                                        padding: EdgeInsets.only(right: 18),
                                        child: GestureDetector(
                                          onTap: increment,
                                          child: Container(
                                            width: 40,
                                            height: 40,
                                            decoration: BoxDecoration(
                                              color: Color(0xffFE724C),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Color(0xffFE724C)
                                                      .withOpacity(0.8),
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
                                              borderRadius:
                                                  BorderRadius.circular(35),
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
                                ],
                              ),
                            ),
                          ],
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
