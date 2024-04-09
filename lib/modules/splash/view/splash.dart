import 'package:flutter/material.dart';
import 'package:food_delivery/modules/pages/view/onboard.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) {
        return const OnBoard();
      }), (p) => false);
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/rajeev_kitchen.png",
              fit: BoxFit.cover,
            )
          ],
        ),
      ),
    );
  }
}
