import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controllers/auth_controller.dart';
import '../../../../utils/global/global.dart';

class LoginScreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: SizedBox(
              height: h,
              child: Column(
                children: [
                  Container(
                    height: h * .46,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.shopping_cart,
                          size: 100,
                          color: Global.botonColor,
                        ),
                        SizedBox(height: 20),
                        Text(
                          'E-Commerce App',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: h * .54,
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: FittedBox(
                            fit: BoxFit.cover,
                            child: Text(
                              "Welcome Back !",
                              style: Global.size30,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: const EdgeInsets.all(16),
                          height: h * .45,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Global.boxColor,
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(30),
                              topLeft: Radius.circular(30),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              FittedBox(
                                fit: BoxFit.cover,
                                child: Text(
                                  "Sign in to your account",
                                  style: Global.size22,
                                ),
                              ),
                              TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter password';
                                  }
                                  return null;
                                },
                                controller: authController.emailController,
                                autocorrect: true,
                                enableInteractiveSelection: true,
                                style: Global.size16,
                                cursorColor: Colors.black,
                                cursorErrorColor: Colors.red,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: "Enter email address",
                                  hintStyle: Global.size1606,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide.none,
                                  ),
                                  prefixIcon: Icon(Icons.mail),
                                ),
                              ),
                              TextFormField(
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "Please Enter your password";
                                  } else {
                                    return null;
                                  }
                                },
                                controller: authController.passwordController,
                                onSaved: (val) {
                                  Global.enter_password = val!;
                                },
                                autocorrect: true,
                                enableInteractiveSelection: true,
                                style: Global.size16,
                                cursorColor: Colors.black,
                                cursorErrorColor: Colors.red,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.lock),
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: "Enter Password",
                                  hintStyle: Global.size1606,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    "Forgot password ?",
                                    style: Global.size16blue,
                                  )
                                ],
                              ),
                              GestureDetector(
                                onTap: () {
                                  if (formKey.currentState!.validate()) {
                                    authController.login();
                                  }
                                },
                                child: Container(
                                  height: h * .0787,
                                  width: w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Global.botonColor,
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Continue",
                                    style: Global.size18,
                                  ),
                                ),
                              ),
                              Center(
                                child: FittedBox(
                                  fit: BoxFit.cover,
                                  child: Row(
                                    children: [
                                      Text(
                                        "Not a member ? ",
                                        style: Global.size16,
                                      ),
                                      Text(
                                        "Create an account",
                                        style: Global.size16blue,
                                      ),
                                    ],
                                  ),
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
          ),
        ),
      ),
    );
  }
}
