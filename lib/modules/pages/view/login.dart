import 'package:flutter/material.dart';
import 'package:food_delivery/modules/pages/view/home.dart';
import 'package:food_delivery/modules/pages/view/signup.dart';
import 'package:food_delivery/modules/widget/widget_support.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                            "LOG IN",
                            style: AppWidget.boldTextFieldStyle(),
                          ),
                          const SizedBox(
                            height: 10,
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
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Container(
                              alignment: Alignment.topRight,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10)),
                              child: Text(
                                "Forgot Password ?",
                                style: AppWidget.semiBoldTextFieldStyle(),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 50.0,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Home()));
                            },
                            child: Material(
                              elevation: 5.0,
                              borderRadius: BorderRadius.circular(30),
                              child: Container(
                                //   margin: const EdgeInsets.all(5),
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(40)),
                                    color: Color.fromARGB(255, 227, 46, 26)),
                                width: MediaQuery.of(context).size.width / 2,
                                child: const Center(
                                  child: Text(
                                    "LOG IN",
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
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Do not have an Account ?",
                          style: AppWidget.semiBoldTextFieldStyle(),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUp()));
                          },
                          child: Container(
                            child: Text(
                              "Sign in",
                              style: AppWidget.semiBoldTextFieldStyle(),
                            ),
                          ),
                        ),
                      ],
                    ),
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
