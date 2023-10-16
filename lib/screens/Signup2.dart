import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import 'package:wedding_planner/screens/HomePage.dart';

class Signup2 extends StatefulWidget {
  String? fname;
  String? lname;
  String? email;

  Signup2({super.key, this.email, this.fname, this.lname});

  @override
  State<Signup2> createState() => _Signup2State();
}

class _Signup2State extends State<Signup2> {
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
              children: [
                SizedBox(
                  height: 6.h,
                ),
                Stack(
                  children: [
                    Container(
                      height: 30.h,
                      width: 100.w,
                      child: Lottie.asset('assets/hrt.json'),
                    ),
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
                  height: 2.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 0.w),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Step : ',
                        style: TextStyle(
                            fontSize: 15.sp,
                            fontFamily: 'sofi',
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                      Text(
                        ' 2 of 2 ',
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontFamily: 'sofi',
                            fontWeight: FontWeight.w700,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 1.5.h),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 1.h,
                        width: 40.w,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(50)),
                      ),
                      Container(
                        height: 1.h,
                        width: 40.w,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(50)),
                      ),
                    ]),
                SizedBox(height: 3.h),
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
                    Get.off(HomeScreen());
                  },
                  child: Container(
                    width: 90.w,
                    height: 7.h,
                    decoration: BoxDecoration(
                      color: Colors.blue,
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
                SizedBox(
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
