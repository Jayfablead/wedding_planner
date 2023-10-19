import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import 'package:wedding_planner/Modal/ChangepassModal.dart';
import 'package:wedding_planner/Provider/authprovider.dart';
import 'package:wedding_planner/main.dart';
import 'package:wedding_planner/screens/LoginPage.dart';
import 'package:wedding_planner/widgets/buildErrorDialog.dart';
import 'package:wedding_planner/widgets/const.dart';
import 'package:wedding_planner/widgets/drawer.dart';
import 'package:wedding_planner/widgets/headerwidget.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  TextEditingController _confpass = TextEditingController();
  TextEditingController _newpass = TextEditingController();
  TextEditingController _oldpass = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;
  bool _obscurePassword1 = true;
  bool _obscurePassword2 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      extendBody: true,
      drawer: drawer1(),
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
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   crossAxisAlignment: CrossAxisAlignment.center,
                //   children: [
                //     InkWell(
                //       onTap: () {
                //         Get.back();
                //       },
                //       child: Icon(
                //         Icons.arrow_back_ios_new_rounded,
                //         color: Colors.blue,
                //         size: 23.sp,
                //       ),
                //     ),
                //     Text(
                //       "",
                //       style: TextStyle(
                //         fontSize: 18.sp,
                //         fontFamily: 'sofi',
                //         color: Colors.blue,
                //         letterSpacing: 1,
                //         fontWeight: FontWeight.bold,
                //       ),
                //     ),
                //     IconButton(
                //         onPressed: () {
                //           openDrawer();
                //         },
                //         icon: Icon(
                //           Icons.menu_rounded,
                //           color: Colors.blue,
                //           size: 23.sp,
                //         ))
                //   ],
                // ),
                header(text: "",callback: (){
                  Get.back();
                },callback1: (){
                  scaffoldKey.currentState?.openDrawer();
                }),
                Container(
                  height: 30.h,
                  width: 100.w,
                  child: Lottie.asset('assets/pl.json'),
                ),
                Row(
                  children: [
                    Text(
                      "Change Password",
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
                          controller: _oldpass,
                          decoration: InputDecoration(
                            hintText: 'Enter Old Password',
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
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
                              return 'Please enter old your Password';
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
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.w),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 90.w,
                        child: TextFormField(
                          obscureText: _obscurePassword1,
                          controller: _newpass,
                          decoration: InputDecoration(
                            hintText: 'Enter New Password',
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
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
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
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
                              return 'Please enter new your Password';
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
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.w),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 90.w,
                        child: TextFormField(
                          obscureText: _obscurePassword2,
                          controller: _confpass,
                          decoration: InputDecoration(
                            hintText: 'Enter Confirm Password',
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
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
                            suffixIcon: IconButton(
                              icon: Icon(
                                  _obscurePassword2
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
                                  color: Colors.grey),
                              onPressed: () {
                                setState(() {
                                  _obscurePassword2 = !_obscurePassword2;
                                });
                              },
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your Confirm-Password';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 4.h,
                ),
                InkWell(
                  onTap: () {
                    changepassap();
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
                      "Continue",
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

  changepassap() {
    if (_formKey.currentState!.validate()) {
      final Map<String, String> data = {};
      data['oldPassword'] = _oldpass.text.trim().toString();
      data['newPassword'] = _newpass.text.trim().toString();
      if (_confpass.text == _newpass.text) {
        checkInternet().then((internet) async {
          if (internet) {
            authprovider().changepassapi(data).then((response) async {
              changepass = ChangepassModal.fromJson(json.decode(response.body));
              if (response.statusCode == 200 && changepass?.status == "1") {
                buildErrorDialog1(
                  context,
                  "Success",
                  changepass?.message ?? "",
                  () {
                    Get.to(LoginPage());
                  },
                );
              } else {
                buildErrorDialog(
                    context, " Error", (changepass?.message).toString());
              }
            });
          } else {
            buildErrorDialog(context, 'Error', "Internet Required");
          }
        });
      } else {
        buildErrorDialog(
            context, "Error", "Password and Confirm-password should be same");
      }
    }
  }
}
