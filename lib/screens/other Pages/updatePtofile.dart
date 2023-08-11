import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';

import 'package:sizer/sizer.dart';

class UpdateProfile extends StatefulWidget {
  String? name;
  String? profile;
  String? phone;
  String? about;
  String? add;

  UpdateProfile({
    super.key,
    this.name,
    this.profile,
    this.phone,
    this.add,
    this.about,
  });

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  TextEditingController _user = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _about = TextEditingController();
  TextEditingController _add = TextEditingController();
  ImagePicker _picker = ImagePicker();
  ImagePicker _picker1 = ImagePicker();
  var imagesTemporary;
  File? imagefile;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isLoading = true;
  XFile? image;
  XFile? video;
  List<XFile>? _imageFileList;
  int? select;
  String? it;
  bool isloading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _user.text = widget.name.toString();
    _about.text = widget.about.toString();
    _phone.text = widget.phone.toString();
    _add.text = widget.add.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body:SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                child: Column(
                  children: [
                    SizedBox(
                      height: 4.h,
                    ),
                    SizedBox(
                      height: 7.h,
                    ),
                    Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 1.w),
                              height: 15.h,
                              width: 30.w,
                              padding: EdgeInsets.all(1.w),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(90),
                                child: (imagefile != null)
                                    ? Image.file(
                                        imagefile!,
                                        width: 300.0,
                                        fit: BoxFit.cover,
                                      )
                                    : CachedNetworkImage(
                                        fit: BoxFit.cover,
                                        imageUrl: widget.profile ?? '',
                                        progressIndicatorBuilder:
                                            (context, url, progress) =>
                                                CircularProgressIndicator(),
                                        errorWidget: (context, url, error) =>
                                            Image.asset(
                                          'assets/user.png',
                                          color: Colors.black,
                                        ),
                                      ),
                              ),
                            ),
                            Positioned(
                                top: 9.5.h,
                                left: 21.w,
                                child: InkWell(
                                    onTap: () async {
                                      final image = await _picker.pickImage(
                                          source: ImageSource.gallery);
                                      setState(() {
                                        imagefile = File(image!.path);
                                      });
                                    },
                                    child: Container(
                                        padding: EdgeInsets.all(2.w),
                                        decoration: BoxDecoration(
                                            color:
                                                // bgcolor
                                                Colors.black,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: const Icon(
                                          Icons.camera_alt_outlined,
                                          color: Colors.pink,
                                        )))),
                          ],
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Container(
                          padding: EdgeInsets.all(3.w),
                          margin: EdgeInsets.all(3.w),
                          // height: .h,
                          width: 99.w,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20.0),
                              border: Border.all(color: Colors.pink)),
                          child: Form(
                            child: Column(
                              children: [
                                Container(
                    

                                  
                             
                                  alignment: Alignment.center,
                                  child: TextFormField(
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'sofi',
                                        letterSpacing: 2,
                                        fontWeight: FontWeight.w600,
                                    fontSize: 13.sp),
                                    controller: _user,
                                    keyboardType: TextInputType.text,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Please enter the user name";
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                        errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(90),
                                          borderSide: BorderSide(
                                              color: Colors.black87),
                                        ),
                                        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(90),
                                          borderSide: BorderSide(
                                              color: Colors.black87),
                                        ),
                                        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(90),
                                          borderSide: BorderSide(
                                              color: Colors.black87),
                                        ),
                                        suffixIcon: Icon(
                                          Icons.person,
                                          color: Colors.black,
                                        ),
                                        hintText: "Full Name",
                                        hintStyle: TextStyle(
                                            color: Colors.black87,
                                            fontFamily: 'sofi',
                                            letterSpacing: 2,fontWeight: FontWeight.w600,
                                            fontSize: 13.sp)),
                                  ),
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Container(
                                  child: TextFormField(
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'sofi',
                                        letterSpacing: 2,fontWeight: FontWeight.w600,
                                        fontSize: 13.sp),
                                    controller: _phone,
                                    keyboardType: TextInputType.text,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Please enter your phone";
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                        errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(90),
                                          borderSide: BorderSide(
                                              color: Colors.black87),
                                        ),
                                        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(90),
                                          borderSide: BorderSide(
                                              color: Colors.black87),
                                        ),
                                        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(90),
                                          borderSide: BorderSide(
                                              color: Colors.black87),
                                        ),
                                        suffixIcon: Icon(
                                          Icons.phone,
                                          color: Colors.black,
                                        ),
                                        hintText: "Phone number",
                                        hintStyle: TextStyle(
                                            color: Colors.black87,
                                            fontFamily: 'sofi',
                                            letterSpacing: 2,
                                            fontWeight: FontWeight.w600,
                                        fontSize: 13.sp)),
                                  ),
                                ),SizedBox(
                                  height: 2.h,
                                ),
                                Container(
                                  child: TextFormField(
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'sofi',height: 0.12.h,
                                        letterSpacing: 2,fontWeight: FontWeight.w600,
                                        fontSize: 13.sp),
                                    controller: _add,
                                    keyboardType: TextInputType.text,
                                    maxLines: 3,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Enter your Address";
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                        errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20),
                                          borderSide: BorderSide(
                                              color: Colors.black87),
                                        ),
                                        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20),
                                          borderSide: BorderSide(
                                              color: Colors.black87),
                                        ),
                                        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20),
                                          borderSide: BorderSide(
                                              color: Colors.black87),
                                        ),
                                        suffixIcon: Icon(
                                          CupertinoIcons.home,
                                          color: Colors.black,
                                        ),
                                        hintText: "Address",
                                        hintStyle: TextStyle(
                                            color: Colors.black87,
                                            fontFamily: 'sofi',
                                            letterSpacing: 2,fontWeight: FontWeight.w600,
                                            fontSize: 13.sp)),
                                  ),
                                ),SizedBox(
                                  height: 2.h,
                                ),
                                Container(
                                  child: TextFormField(
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'sofi',height: 0.12.h,
                                        letterSpacing: 2,fontWeight: FontWeight.w600,
                                        fontSize: 13.sp),
                                    controller: _about,
                                    keyboardType: TextInputType.text,
                                    maxLines: 7,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Enter About Detials";
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                        errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20),
                                          borderSide: BorderSide(
                                              color: Colors.black87),
                                        ),
                                        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20),
                                          borderSide: BorderSide(
                                              color: Colors.black87),
                                        ),
                                        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20),
                                          borderSide: BorderSide(
                                              color: Colors.black87),
                                        ),
                                        suffixIcon: Icon(
                                          Icons.info_outline_rounded,
                                          color: Colors.black,
                                        ),
                                        hintText: "About",
                                        hintStyle: TextStyle(
                                            color: Colors.black87,
                                            fontFamily: 'sofi',
                                            letterSpacing: 2,fontWeight: FontWeight.w600,
                                            fontSize: 13.sp)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Center(
                          child: InkWell(
                            onTap: () async {
                              print('zoro');
                              Get.back();
                            },
                            child: Container(
                              height: 5.5.h,
                              width: 45.w,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Colors.pink,
                                  borderRadius: BorderRadius.circular(30)),
                              child: Text(
                                'Update Profile',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13.sp,
                                  fontFamily: 'sofi',
                                  letterSpacing: 2,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  TextStyle textStyle =
      TextStyle(color: Colors.black, fontSize: 12.sp, fontFamily: "Meta1");
  TextStyle textStyle1 = TextStyle(
      fontFamily: "Meta1",
      fontSize: 10.sp,
      color: Colors.grey,
      fontWeight: FontWeight.w400);

  InputDecoration inputDecoration({
    required String lable,
    required Icon icon,
  }) {
    return InputDecoration(
      floatingLabelBehavior: FloatingLabelBehavior.always,
      contentPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 1.5.h),
      fillColor: Colors.grey.shade200,
      hoverColor: Colors.white,
      focusColor: Colors.white,
      filled: true,
      errorStyle: TextStyle(
        color: Colors.red,
      ),
      // hintText: "jjhbf",
      label: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: Text(lable),
      ),

      hintStyle: textStyle1,
      labelStyle:
          TextStyle(fontSize: 12.sp, fontFamily: "Meta1", color: Colors.grey),
      prefixIcon: icon,
      prefixIconColor: Colors.grey,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20.sp)),
        borderSide: BorderSide(
          color: Colors.white,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20.sp)),
        borderSide: BorderSide(
          color: Colors.white,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20.sp)),
        borderSide: BorderSide(
          color: Colors.white,
        ),
      ),
    );
  }
}
