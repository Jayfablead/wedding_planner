import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import 'package:wedding_planner/Modal/ForgotpassModal.dart';
import 'package:wedding_planner/Provider/authprovider.dart';
import 'package:wedding_planner/widgets/buildErrorDialog.dart';
import 'package:wedding_planner/widgets/const.dart';

import 'LoginPage.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController _email = TextEditingController();
  TextEditingController _passwod = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
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
                        child: Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: Colors.blue,
                          size: 23.sp,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 30.h,
                  width: 100.w,
                  child: Lottie.asset('assets/pl.json'),
                ),
                Row(
                  children: [
                    Text(
                      "Forgot Password",
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
                                color: Colors.white,
                              ),
                              borderRadius: BorderRadius.circular(90),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(90),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(90),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(90),
                            ),
                            fillColor: Colors.white,
                            filled: true,
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
                InkWell(
                  onTap: () {
                    forgotpassap();
                    if (_formKey.currentState!.validate()) {}
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
                      "Send",
                      style: TextStyle(
                          fontSize: 17.sp,
                          color: Colors.white,
                          fontFamily: 'get'),
                    )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  forgotpassap() {
    if (_formKey.currentState!.validate()) {
      final Map<String, String> data = {};
      data['email'] = _email.text.trim().toString();
      checkInternet().then((internet) async {
        if (internet) {
          authprovider().forgotpassapi(data).then((response) async {
            forgotpass = ForgotpassModal.fromJson(json.decode(response.body));

            if (response.statusCode == 200 && forgotpass?.status == "1") {
              buildErrorDialog1(
                context,
                "Email",
                forgotpass?.message ?? "",
                () {
                  Get.to(LoginPage());
                },
              );
            } else {
              buildErrorDialog(
                  context, "Email Sent Error", forgotpass?.message ?? "");
            }
          });
        } else {
          buildErrorDialog(context, 'Error', "Internet Required");
        }
      });
    }
  }
}
