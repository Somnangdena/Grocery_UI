import 'package:flutter/material.dart';
import 'package:grocery_app/Utils/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Column(
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
                          onChanged: (value) {},
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
            Padding(padding: EdgeInsets.symmetric()),
          ],
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
                    letterSpacing: 1.5,
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
              shape: .circle,
              color: Colors.amber,
              image: DecorationImage(image: AssetImage("assets/images/p3.png")),
            ),
          ),
        ],
      ),
    );
  }
}
