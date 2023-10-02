import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import 'package:wedding_planner/screens/forgot%20password%20Page.dart';

import 'HomePage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _email = TextEditingController();
  TextEditingController _passwod = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.w),
            child: Column(
              children: [
                SizedBox(
                  height: 6.h,
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 3.w),
                        padding: EdgeInsets.all(0.7.h),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 2),
                            borderRadius: BorderRadius.circular(90)),
                        child: Icon(Icons.arrow_back_ios_new_rounded),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 30.h,
                  width: 100.w,
                  child: Lottie.asset('assets/hrt.json'),
                ),
                Row(
                  children: [
                    Text(
                      "Sign in to Continue",
                      style: TextStyle(
                          fontSize: 22.sp,
                          fontFamily: 'get',
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                          color: Colors.black),
                    ),
                  ],
                ),
                SizedBox(
                  height: 3.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Email Address",
                      style: TextStyle(
                          fontSize: 14.sp,
                          letterSpacing: 1,
                          fontFamily: 'Sofi',
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                    ),
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.w),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 90.w,
                        child: TextFormField(
                          controller: _email,
                          decoration: InputDecoration(
                            hintText: 'Enter Email Address',
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black87,
                              ),
                              borderRadius: BorderRadius.circular(90),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black87),
                              borderRadius: BorderRadius.circular(90),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black87),
                              borderRadius: BorderRadius.circular(90),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black87),
                              borderRadius: BorderRadius.circular(90),
                            ),
                            errorStyle: TextStyle(
                                fontSize: 12.sp,
                                fontFamily: 'sofi',
                                letterSpacing: 0.7,
                                fontWeight: FontWeight.bold),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your Email';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Password",
                      style: TextStyle(
                          fontSize: 14.sp,
                          letterSpacing: 1,
                          fontFamily: 'Sofi',
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                    ),
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.w),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 90.w,
                        child: TextFormField(
                          obscureText: _obscurePassword,
                          controller: _passwod,
                          decoration: InputDecoration(
                            hintText: 'Enter Password',
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black87),
                              borderRadius: BorderRadius.circular(90),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black87),
                              borderRadius: BorderRadius.circular(90),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black87),
                              borderRadius: BorderRadius.circular(90),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black87),
                              borderRadius: BorderRadius.circular(90),
                            ),
                            errorStyle: TextStyle(
                                fontSize: 12.sp,
                                fontFamily: 'sofi',
                                letterSpacing: 0.7,
                                fontWeight: FontWeight.bold),
                            suffixIcon: IconButton(
                              icon: Icon(
                                  _obscurePassword
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
                                  color: Colors.grey),
                              onPressed: () {
                                setState(() {
                                  _obscurePassword = !_obscurePassword;
                                });
                              },
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your Password';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {
                          Get.to(ForgotPassword());
                        },
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(
                              fontSize: 13.5.sp,
                              letterSpacing: 1,
                              fontFamily: 'sofi',
                              fontWeight: FontWeight.bold,
                              color: Colors.pink),
                        ))
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                InkWell(
                  onTap: () {
                    Get.off(HomeScreen());
                  },
                  child: Container(
                    width: 90.w,
                    height: 7.h,
                    decoration: BoxDecoration(
                      color: Colors.pink,
                      borderRadius: BorderRadius.circular(25.sp),
                    ),
                    child: Center(
                        child: Text(
                      "Sign In",
                      style: TextStyle(
                          fontSize: 17.sp,
                          color: Colors.white,
                          fontFamily: 'get'),
                    )),
                  ),
                ),
                SizedBox(height: 2.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
