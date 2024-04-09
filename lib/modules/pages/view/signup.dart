import 'package:firebase_auth/firebase_auth.dart';
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
  String name = "", email = "", password = "";
  TextEditingController namecontroller = new TextEditingController();

  TextEditingController emailcontroller = new TextEditingController();

  TextEditingController passwordcontroller = new TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  registration() async {
    if (password != null) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              "Succesfully Registered",
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.w300),
            )));
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => Home()),
          (Route<dynamic> route) => false,
        );
        // Navigator.push(context,MaterialPageRoute(builder: (context) => Home()));
      } on FirebaseException catch (e) {
        if (e.code == 'weak-password') {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              backgroundColor: Colors.orange,
              content: Text(
                "Password provided is too weak",
                style: TextStyle(fontSize: 18),
              )));
        } else if (e.code == 'email-already-in-use') {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              backgroundColor: Colors.orange,
              content: Text(
                "Entered email is already registered ",
                style: TextStyle(fontSize: 18),
              )));
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
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
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 3),
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
                        child: Form(
                          key: _formkey,
                          child: Column(
                            children: [
                              Text(
                                "Sign In",
                                style: AppWidget.boldTextFieldStyle(),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: TextFormField(
                                  controller: namecontroller,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Please Enter the UserName";
                                    }
                                    return null;
                                  },
                                  decoration: const InputDecoration(
                                      prefixIcon: Icon(Icons.person_4),
                                      hintText: "Username here",
                                      hintStyle: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w400)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: TextFormField(
                                  controller: emailcontroller,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Please Enter the Email";
                                    }
                                    return null;
                                  },
                                  decoration: const InputDecoration(
                                      prefixIcon: Icon(Icons.email_rounded),
                                      hintText: "gajanand@example.com",
                                      hintStyle: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w400)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: TextFormField(
                                  controller: passwordcontroller,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Please Enter the Password";
                                    }
                                    return null;
                                  },
                                  obscureText: true,
                                  decoration: const InputDecoration(
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
                                  onTap: () async {
                                    if (_formkey.currentState!.validate()) {
                                      setState(() {
                                        email = emailcontroller.text;
                                        name = namecontroller.text;
                                        password = passwordcontroller.text;
                                      });
                                    }
                                    registration();
                                  },
                                  child: Container(
                                    //   margin: const EdgeInsets.all(5),
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(40)),
                                        color:
                                            Color.fromARGB(255, 227, 46, 26)),
                                    width:
                                        MediaQuery.of(context).size.width / 2,
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
      ),
    );
  }
}
