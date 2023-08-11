import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import 'package:wedding_planner/screens/HomePage.dart';

import 'LoginPage.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController _firstname = TextEditingController();
  TextEditingController _lastname = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password1 = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;
  bool _obscurePassword1 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: Column(
              children: [SizedBox(height: 6.h,),
                Row(
                  children: [
                    InkWell(onTap: (){
                      Get.back();
                    },
                      child: Container(margin: EdgeInsets.only(left: 3.w),
                        padding: EdgeInsets.all(0.7.h),
                        decoration: BoxDecoration(border: Border.all(color: Colors.black,width: 2),borderRadius: BorderRadius.circular(90)),child: Icon(Icons.arrow_back_ios_new_rounded), ),
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
                      "Create Account",
                      style: TextStyle(
                          fontSize: 22.sp,
                          fontFamily: 'get',
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                          color: Colors.black),
                    )
                  ],
                ),
                SizedBox(
                  height: 4.h,
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "First Name",
                          style: TextStyle(
                              fontSize: 14.sp,
                              letterSpacing: 1,
                              fontFamily: 'Sofi',
                              fontWeight: FontWeight.w700,
                              color: Colors.black),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        SizedBox(
                          width: 45.w,
                          child: TextFormField(
                            controller: _firstname,
                            decoration: InputDecoration(
                              hintText: 'Enter First Name',
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
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter First Name';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.name,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Last Name",
                          style: TextStyle(
                              fontSize: 14.sp,
                              letterSpacing: 1,
                              fontFamily: 'Sofi',
                              fontWeight: FontWeight.w700,
                              color: Colors.black),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        SizedBox(
                          width: 45.w,
                          child: TextFormField(
                            controller: _lastname,
                            decoration: InputDecoration(
                              hintText: 'Enter Last Name',
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
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter Last Name';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.name,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Phone Number",
                          style: TextStyle(
                              fontSize: 14.sp,
                              letterSpacing: 1,
                              fontFamily: 'Sofi',
                              fontWeight: FontWeight.w700,
                              color: Colors.black),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        SizedBox(
                          width: 92.w,
                          child: TextFormField(
                            controller: _phone,
                            decoration: InputDecoration(
                              hintText: 'Enter Last Name',
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
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your Last Name';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                        SizedBox(
                          height: 2.h,
                        ),
                        SizedBox(
                          width: 92.w,
                          child: TextFormField(
                            controller: _email,
                            decoration: InputDecoration(
                              hintText: 'Enter Email Address',
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
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your Email Address';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.emailAddress,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                        SizedBox(
                          height: 2.h,
                        ),
                        SizedBox(
                          width: 92.w,
                          child: TextFormField(
                            obscureText: _obscurePassword,
                            controller: _password,
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
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Confirm Password",
                          style: TextStyle(
                              fontSize: 14.sp,
                              letterSpacing: 1,
                              fontFamily: 'Sofi',
                              fontWeight: FontWeight.w700,
                              color: Colors.black),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        SizedBox(
                          width: 92.w,
                          child: TextFormField(
                            obscureText: _obscurePassword1,
                            controller: _password1,
                            decoration: InputDecoration(
                              hintText: 'Enter Confirm Password',
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
                                    _obscurePassword1
                                        ? Icons.visibility_outlined
                                        : Icons.visibility_off_outlined,
                                    color: Colors.grey),
                                onPressed: () {
                                  setState(() {
                                    _obscurePassword1 = !_obscurePassword1;
                                  });
                                },
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your Confrom Password';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 4.h,
                ),
                InkWell(
                  onTap: () {
Get.off(HomeScreen());                    },
                  child: Container(
                    width: 90.w,
                    height: 7.h,
                    decoration: BoxDecoration(
                      color: Colors.pink,
                      borderRadius: BorderRadius.circular(25.sp),
                    ),
                    child: Center(
                        child: Text(
                      "Sign up",
                      style: TextStyle(
                          fontSize: 17.sp,
                          color: Colors.white,
                          fontFamily: 'get'),
                    )),
                  ),
                ),
                SizedBox(height: 01.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                        width: 40.w,
                        child: Divider(color: Colors.black, thickness: 1)),
                    Text(
                      "Or",
                      style: TextStyle(
                          fontSize: 13.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'sofi'),
                    ),
                    SizedBox(
                        width: 40.w,
                        child: Divider(
                          color: Colors.black,
                          thickness: 1,
                        )),
                  ],
                ),
                SizedBox(height: 1.h),
                Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already a User ?',
                        style: TextStyle(
                            fontSize: 15.sp,
                            fontFamily: 'sofi',
                            fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                          onPressed: () {
                            Get.to(LoginPage());


                          },
                          child: Text(
                            "Login",
                            style: TextStyle(
                                fontSize: 14.sp,
                                letterSpacing: 1,
                                fontFamily: 'sofi',
                                fontWeight: FontWeight.bold,
                                color: Colors.pink),
                          ))
                    ]), SizedBox(
                  height: 2.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
