import 'package:flutter/material.dart';
import 'package:grocery_app/screens/product_detail_screen.dart';
import 'package:grocery_app/utils/constants.dart';
import 'package:grocery_app/models/products.dart';
import 'package:grocery_app/widgets/product_items_display.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String categoryes = "ALL";
  List<Grocery> grocery = groceryItems;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: .start,
          children: [
            headerParts(),
            //for search bar and filter
            SizedBox(height: 30),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 65,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        borderRadius: .circular(15),
                        color: Colors.white,
                      ),
                      child: Center(
                        child: TextField(
                          onChanged: (value) {
                            setState(() {
                              grocery = groceryItems
                                  .where(
                                    (element) => element.name
                                        .toLowerCase()
                                        .contains(value.toLowerCase()),
                                  )
                                  .toList();
                            });
                          },
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.grey,
                              size: 30,
                            ),
                            hintText: "Search Grocery",
                            hintStyle: TextStyle(
                              fontSize: 18,
                              color: Colors.grey,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      borderRadius: .circular(15),
                      color: Colors.green[50],
                    ),
                    child: Icon(
                      Icons.tune_rounded,
                      size: 30,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),

            // for category
            const SizedBox(height: 20),
            categoryItems(),

            // display the category items
            SingleChildScrollView(
              scrollDirection: .horizontal,
              child: Padding(
                padding: .symmetric(vertical: 10),
                child: Row(
                  children: List.generate(
                    grocery.length,
                    (index) => GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                ProductDetailScreen(product: grocery[index]),
                          ),
                        );
                      },
                      child: Padding(
                        padding: .only(left: 20),
                        child: ProuductItemsDisplays(grocery: grocery[index]),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: .only(top: 15, left: 20),
              child: Text(
                "Recent Shop",
                style: TextStyle(fontSize: 20, fontWeight: .bold),
              ),
            ),

            SingleChildScrollView(
              scrollDirection: .horizontal,
              child: Row(
                children: List.generate(
                  groceryItems.where((item) => item.isRecent).length,
                  (index) {
                    // get only the items whose isRecent value is ture.
                    Grocery recent = groceryItems
                        .where((items) => items.isRecent)
                        .toList()[index];
                    return Padding(
                      padding: index == 0
                          ? EdgeInsets.symmetric(horizontal: 20)
                          : EdgeInsets.only(right: 20),
                      child: Container(
                        padding: EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: .circular(20),
                        ),
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(40),
                              decoration: BoxDecoration(
                                color: Colors.blue[50],
                                borderRadius: .circular(15),
                                image: DecorationImage(
                                  image: AssetImage(recent.image),
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                children: [
                                  Text(
                                    recent.name,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: .bold,
                                    ),
                                  ),
                                  Text(
                                    recent.category,
                                    style: TextStyle(
                                      fontSize: 16,
                                      height: 2,
                                      fontWeight: .bold,
                                      color: Colors.grey.shade400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              "\$${recent.price.toStringAsFixed(2)}",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: .bold,
                                letterSpacing: -2,
                                color: Colors.green,
                              ),
                            ),
                            SizedBox(width: 10),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding categoryItems() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: .spaceBetween,
        children: List.generate(
          groceryCategories.length,
          (index) => GestureDetector(
            onTap: () {
              setState(() {
                categoryes = groceryCategories[index];
                categoryes == "ALL"
                    ? grocery = groceryItems
                    : grocery = groceryItems
                          .where(
                            (element) =>
                                element.category.toLowerCase() ==
                                categoryes.toLowerCase(),
                          )
                          .toList();
              });
            },
            child: SizedBox(
              height: 50,
              child: Column(
                children: [
                  Text(
                    groceryCategories[index],
                    style: TextStyle(
                      fontSize: categoryes == groceryCategories[index]
                          ? 18
                          : 16,
                      color: categoryes == groceryCategories[index]
                          ? textgreen
                          : Colors.black26,
                      fontWeight: categoryes == groceryCategories[index]
                          ? .w900
                          : .w500,
                    ),
                  ),
                  // ignore: unrelated_type_equality_checks
                  categoryes == groceryCategories[index]
                      ? CircleAvatar(radius: 4, backgroundColor: textgreen)
                      : SizedBox(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Padding headerParts() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Welcome\n",
                  style: TextStyle(fontSize: 20, color: Colors.grey),
                ),
                TextSpan(
                  text: "Johnny",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    letterSpacing: -1,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              borderRadius: .circular(20),
              color: Colors.amber,
              image: DecorationImage(image: AssetImage("assets/images/p3.png")),
            ),
          ),
        ],
      ),
    );
  }
}
