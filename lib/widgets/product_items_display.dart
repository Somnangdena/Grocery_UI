import 'package:flutter/material.dart';
import 'package:grocery_app/utils/constants.dart';
import 'package:grocery_app/models/products.dart';

class ProuductItemsDisplays extends StatelessWidget {
  final Grocery grocery;
  const ProuductItemsDisplays({super.key, required this.grocery});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.55,
      decoration: BoxDecoration(
        borderRadius: .circular(30),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Padding(
            padding: .all(10),
            child: Stack(
              children: [
                Positioned(
                  bottom: 0,
                  right: 60,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(5, 5),
                          blurRadius: 30,
                          spreadRadius: 15,
                          color: grocery.color.withValues(alpha: 0.2),
                        ),
                      ],
                    ),
                  ),
                ),
                Center(
                  child: Hero(
                    tag: grocery.image,
                    child: Image.asset(grocery.image, height: 160),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: .only(left: 20, bottom: 20, top: 20),
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Text(
                  grocery.name,
                  style: TextStyle(fontSize: 18, fontWeight: .bold),
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: .start,
                      children: [
                        Text(
                          grocery.category,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black26,
                            fontWeight: .w600,
                          ),
                        ),
                        Text(
                          "\$${grocery.price.toStringAsFixed(2)}",
                          style: TextStyle(
                            fontSize: 22,
                            color: textgreen,
                            fontWeight: .w600,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Container(
                      padding: .all(10),
                      decoration: BoxDecoration(
                        borderRadius: .only(
                          topLeft: .circular(15),
                          bottomLeft: .circular(15),
                        ),
                        color: Colors.orange[900],
                      ),
                      child: Icon(
                        Icons.shopping_bag_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
