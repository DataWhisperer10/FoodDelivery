import 'package:flutter/material.dart';
import 'package:food_delivery/modules/pages/view/home.dart';
import 'package:food_delivery/modules/pages/view/login.dart';
import 'package:food_delivery/modules/widget/widget_support.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.pink, Colors.purple],
                ),
              ),
            ),
            Container(
              margin:
                  EdgeInsets.only(top: MediaQuery.of(context).size.height / 3),
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
            ),
            Container(
              margin: const EdgeInsets.only(top: 50, left: 20.0, right: 20.0),
              child: Column(
                children: [
                  Center(
                      child: Image.asset(
                    "assets/rajeev_kitchen.png", //app logo image is here
                    width: MediaQuery.of(context).size.width / 2,
                    fit: BoxFit.cover,
                  )),
                  const SizedBox(
                    height: 20,
                  ),
                  Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 1.8,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          Text(
                            "Sign In",
                            style: AppWidget.boldTextFieldStyle(),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                            child: TextField(
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.person_4),
                                  hintText: "Username here",
                                  hintStyle: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400)),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                            child: TextField(
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.email_rounded),
                                  hintText: "gajanand@example.com",
                                  hintStyle: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400)),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: TextField(
                              obscureText: true,
                              decoration: InputDecoration(
                                  prefixIcon:
                                      Icon(Icons.remove_red_eye_rounded),
                                  hintText: "Password here",
                                  hintStyle: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black54)),
                            ),
                          ),
                          const SizedBox(
                            height: 50.0,
                          ),
                          Material(
                            elevation: 5.0,
                            borderRadius: BorderRadius.circular(30),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Home()));
                              },
                              child: Container(
                                //   margin: const EdgeInsets.all(5),
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(40)),
                                    color: Color.fromARGB(255, 227, 46, 26)),
                                width: MediaQuery.of(context).size.width / 2,
                                child: const Center(
                                  child: Text(
                                    "Sign In",
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Already have an Account ?",
                        style: AppWidget.semiBoldTextFieldStyle(),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: ((context) => Login()),
                            ),
                          );
                        },
                        child: Container(
                          child: Text(
                            "Log in",
                            style: AppWidget.boldTextFieldStyle(),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
