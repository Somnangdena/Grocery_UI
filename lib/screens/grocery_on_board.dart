import 'package:flutter/material.dart';
import 'package:grocery_app/Utils/constants.dart';
import 'package:grocery_app/widgets/bottom_nav_bar.dart';

class GroceryOnBoard extends StatelessWidget {
  const GroceryOnBoard({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          ClipPath(
            clipper: ClipPathOnBoard(),
            child: Container(
              width: size.width,
              height: size.height * 0.6,
              color: onboardbg,
              child: Padding(
                padding: EdgeInsets.only(top: 40),
                child: Image.asset(
                  fit: BoxFit.cover,
                  "assets/images/onboarding_profile.png",
                ),
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.4,
            child: Column(
              children: [
                SizedBox(height: 30),
                Text(
                  "Buy Groceries\nEasilly With Us",
                  style: TextStyle(
                    fontSize: 40,
                    height: 1.3,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Listen podcast and open your\nworld with this application",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 30),
                TextButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (_) => BottomNavBar()),
                      (route) => false,
                    );
                  },

                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 60, vertical: 20),
                    decoration: BoxDecoration(
                      borderRadius: .circular(50),
                      gradient: gradientColor,
                    ),
                    child: Text(
                      "Get Started",
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ClipPathOnBoard extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(
      size.width / 2,
      size.height - 70,
      size.width,
      size.height,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
