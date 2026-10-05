import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:grocery_app/Utils/constants.dart';
import 'package:grocery_app/models/products.dart';
import 'package:readmore/readmore.dart';

class ProductDetailScreen extends StatefulWidget {
  final Grocery product;
  const ProductDetailScreen({super.key, required this.product});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: bgColor,
      appBar: headerParts(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // for image item bg
            Stack(
              children: [
                const SizedBox(height: 350),

                Positioned(
                  bottom: 30,
                  left: 20,
                  right: 20,
                  child: Container(
                    height: 200,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 12,
                          spreadRadius: 20,
                          color: widget.product.color.withValues(alpha: .1),
                        ),
                      ],
                    ),
                  ),
                ),
                ClipPath(
                  clipper: ClipPathDetail(),
                  child: Container(
                    height: 300,
                    width: size.width,
                    color: widget.product.color.withValues(alpha: 0.15),
                  ),
                ),
                Positioned(
                  bottom: -30,
                  left: 20,
                  right: 20,
                  child: Hero(
                    tag: widget.product.image,
                    child: Image.asset(
                      widget.product.image,
                      width: size.width,
                      height: 400,
                    ),
                  ),
                ),
              ],
            ),

            // items details
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  Text(
                    widget.product.name,
                    style: TextStyle(fontSize: 35, fontWeight: .w900),
                  ),
                  Row(
                    children: [
                      RatingBar.builder(
                        initialRating: widget.product.rate,
                        itemSize: 30,
                        allowHalfRating: true,
                        itemBuilder: (context, index) =>
                            Icon(Icons.star_rounded, color: Colors.orange),
                        onRatingUpdate: (rating) {},
                      ),
                      Text(
                        "(${widget.product.rate})",
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                      Spacer(),
                      // for quantity increment decrement
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                quantity > 1 ? quantity-- : null;
                              });
                            },
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                shape: .circle,
                                color: Colors.green[50],
                              ),
                              child: const Center(
                                child: Text(
                                  "-",
                                  style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.green,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Text(
                            quantity.toString(),
                            style: TextStyle(fontSize: 18, fontWeight: .bold),
                          ),
                          SizedBox(width: 10),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                quantity++;
                              });
                            },
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                shape: .circle,
                                gradient: gradientColor,
                              ),
                              child: const Center(
                                child: Text(
                                  "+",
                                  style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Description",
                    style: TextStyle(fontSize: 18, fontWeight: .bold),
                  ),
                  const SizedBox(height: 20),
                  ReadMoreText(
                    "${widget.product.name} ${widget.product.description}",
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: .w500,
                      height: 1.5,
                      color: Colors.black26,
                    ),
                    trimLength: 110,
                    trimCollapsedText: "Read More",
                    trimExpandedText: "Read Less",
                    moreStyle: TextStyle(
                      fontWeight: .bold,
                      color: widget.product.color,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    height: 175,
                    width: size.width,
                    decoration: BoxDecoration(
                      borderRadius: .circular(20),
                      color: Colors.grey,
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          top: 60,
                          left: 70,
                          child: CircleAvatar(
                            radius: 20,
                            backgroundColor: widget.product.color,
                          ),
                        ),
                        const Positioned(
                          top: 73,
                          left: 83,
                          child: CircleAvatar(
                            radius: 7,
                            backgroundColor: Colors.white,
                          ),
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
      bottomNavigationBar: Container(
        height: 100,
        color: Colors.white,
        child: Row(
          crossAxisAlignment: .start,
          children: [
            Padding(
              padding: .symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  Text(
                    "Price",
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                  Text(
                    "\$${widget.product.price.toStringAsFixed(2)}",
                    style: TextStyle(fontSize: 32, fontWeight: .bold),
                  ),
                ],
              ),
            ),
            Spacer(),
            TextButton(
              onPressed: () {},
              child: Container(
                padding: .symmetric(vertical: 20, horizontal: 40),
                decoration: BoxDecoration(
                  borderRadius: .circular(15),
                  gradient: gradientColor,
                ),
                child: Text(
                  "Add to Cart",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: .bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar headerParts(BuildContext context) {
    return AppBar(
      leadingWidth: 80,
      automaticallyImplyLeading: false,
      backgroundColor: widget.product.color.withValues(alpha: 0.15),
      actions: [
        Container(
          margin: .only(left: 20),
          decoration: BoxDecoration(
            borderRadius: .circular(10),
            color: Colors.white,
          ),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new, color: widget.product.color),
          ),
        ),
        Spacer(),
        Container(
          margin: .only(right: 20),
          decoration: BoxDecoration(
            borderRadius: .circular(10),
            color: Colors.white,
          ),
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.shopping_cart_outlined,
              color: widget.product.color,
            ),
          ),
        ),
      ],
    );
  }
}

class ClipPathDetail extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 50);
    path.quadraticBezierTo(
      size.width / 2,
      size.height + 50,
      size.width,
      size.height - 50,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
