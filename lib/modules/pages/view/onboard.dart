import 'package:flutter/material.dart';
import 'package:food_delivery/modules/pages/view/signup.dart';
import 'package:food_delivery/modules/widget/content_model.dart';
import 'package:food_delivery/modules/widget/widget_support.dart';

class OnBoard extends StatefulWidget {
  const OnBoard({super.key});

  @override
  State<OnBoard> createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
  int currentIndex = 0;
  late PageController _controller;
  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                  controller: _controller,
                  itemCount: contents.length,
                  onPageChanged: (int index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  itemBuilder: (_, i) {
                    return Padding(
                      padding: const EdgeInsets.only(
                          top: 40, left: 20.0, right: 20.0),
                      child: Column(
                        children: [
                          Image.asset(
                            contents[i].image,
                            height: 250,
                            width: MediaQuery.of(context).size.width,
                            fit: BoxFit.fill,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            contents[i].title,
                            style: AppWidget.semiBoldTextFieldStyle(),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            contents[i].description,
                            style: AppWidget.semiLightTextFieldStyle(),
                          )
                        ],
                      ),
                    );
                  }),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  contents.length,
                  (index) => buildDot(index, context),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                if (currentIndex == contents.length - 1) {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => SignUp()));
                }
                _controller.nextPage(
                    duration: const Duration(microseconds: 100),
                    curve: Curves.bounceIn);
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(20)),
                height: 60,
                margin: const EdgeInsets.all(10),
                width: double.infinity,
                child: const Center(
                  child: Text(
                    "Next",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Poppins",
                        fontSize: 30,
                        fontWeight: FontWeight.w300),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: currentIndex == index ? 16 : 7,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: Colors.black),
    );
  }
}
