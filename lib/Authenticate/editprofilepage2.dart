import 'dart:convert';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';
import 'package:wedding_planner/Authenticate/profilePage.dart';
import 'package:wedding_planner/Modal/UpdateprofileModal.dart';
import 'package:wedding_planner/Provider/authprovider.dart';
import 'package:wedding_planner/main.dart';
import 'package:wedding_planner/widgets/buildErrorDialog.dart';
import 'package:wedding_planner/widgets/const.dart';

// import '../../widgets/drawer.dart';

class EditProfile2 extends StatefulWidget {
  String? fname;
  String? lname;
  String? address;
  String? phone;
  String? about;
  String? image;

  EditProfile2(
      {super.key,
      this.image,
      this.about,
      this.address,
      this.phone,
      this.lname,
      this.fname});

  @override
  State<EditProfile2> createState() => _EditProfile2State();
}

class _EditProfile2State extends State<EditProfile2> {
  TextEditingController _gname = TextEditingController();
  TextEditingController _bname = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _address = TextEditingController();
  TextEditingController _about = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool isKeyboardOpen = false;
  ImagePicker _picker = ImagePicker();
  File? _pickedFile;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      _gname.text = widget.fname == '' || widget.fname == null
          ? ''
          : widget.fname.toString();
      _bname.text = widget.lname == '' || widget.lname == null
          ? ''
          : widget.lname.toString();
      _phone.text = widget.phone == '' || widget.phone == null
          ? ''
          : widget.phone.toString();
      _address.text = widget.address == '' || widget.address == null
          ? ''
          : widget.address.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        // drawer: drawer1(),
        key: scaffoldKey,
        body: Builder(
          builder: (context) {
            return Listener(
              onPointerMove: (event) {
                // Detect keyboard state based on the viewInsets
                final keyboardOpen =
                    MediaQuery.of(context).viewInsets.bottom > 0;

                // Update the value of isKeyboardOpen
                if (keyboardOpen != isKeyboardOpen) {
                  setState(() {
                    isKeyboardOpen = keyboardOpen;
                  });
                }
              },
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage(
                    'assets/profile.png',
                  ),
                  fit: BoxFit.cover,
                )),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.w),
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: 5.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  icon: Icon(
                                    Icons.arrow_back_ios_new_rounded,
                                    color: Colors.white,
                                    size: 23.sp,
                                  )),
                              Text(
                                "Edit Profile",
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  fontFamily: 'sofi',
                                  color: Colors.white,
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              IconButton(onPressed: () {}, icon: Icon(null))
                            ],
                          ),
                        ],
                      ),
                      Positioned(
                        top: 12.5.h,
                        left: 32.8.w,
                        child: Container(
                          height: 15.h,
                          width: 31.5.w,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 4),
                            borderRadius: BorderRadius.circular(90),
                          ),
                          child: Container(
                            height: 14.5.h,
                            width: 31.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(90),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(90),
                              child: _pickedFile != null
                                  ? Image.file(
                                      _pickedFile!,
                                      fit: BoxFit.cover,
                                    )
                                  : CachedNetworkImage(
                                      fit: BoxFit.cover,
                                      imageUrl: widget.image.toString(),
                                      progressIndicatorBuilder:
                                          (context, url, progress) =>
                                              CircularProgressIndicator(),
                                      errorWidget: (context, url, error) =>
                                          Image.asset(
                                        'assets/user.png',
                                        fit: BoxFit.cover,
                                        height: 14.5.h,
                                        width: 31.w,
                                      ),
                                    ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                          top: 18.8.h,
                          left: 55.5.w,
                          child: Container(
                            height: 11.h,
                            width: 11.w,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.white, width: 3),
                                shape: BoxShape.circle,
                                color: Colors.black),
                            child: GestureDetector(
                              onTap: () async {
                                XFile? photo = await _picker.pickImage(
                                    source: ImageSource.gallery);
                                setState(() {
                                  _pickedFile = File(photo!.path);
                                });
                              },
                              child: Icon(
                                Icons.camera_alt,
                                color: Colors.white,
                                size: 16.sp,
                              ),
                            ),
                          )),
                      Positioned(
                        top: 30.h,
                        child: Form(
                          key: _formKey,
                          child: SingleChildScrollView(
                            child: Container(
                              height: 69.5.h,
                              width: 100.w,
                              child: ListView(
                                  padding: EdgeInsets.zero,
                                  scrollDirection: Axis.vertical,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Groom Name : ",
                                                  style: TextStyle(
                                                    fontSize: 15.sp,
                                                    letterSpacing: 1,
                                                    fontFamily: 'Sofi',
                                                    fontWeight: FontWeight.w700,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                SizedBox(height: 1.h),
                                                SizedBox(
                                                  width: 45.w,
                                                  child: TextFormField(
                                                    controller: _gname,
                                                    decoration: InputDecoration(
                                                      hintText: 'First Name',
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: Colors.white,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(90),
                                                      ),
                                                      disabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color:
                                                                Colors.white),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(90),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color:
                                                                Colors.white),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(90),
                                                      ),
                                                      border:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color:
                                                                Colors.white),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(90),
                                                      ),
                                                      fillColor: Colors.white,
                                                      filled: true,
                                                      errorStyle: TextStyle(
                                                          fontSize: 12.sp,
                                                          fontFamily: 'sofi',
                                                          letterSpacing: 0.7,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    validator: (value) {
                                                      if (value!.isEmpty) {
                                                        return "Enter the first name";
                                                      } else {
                                                        return null;
                                                      }
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              width: 5.w,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Bride Name : ",
                                                  style: TextStyle(
                                                    fontSize: 15.sp,
                                                    letterSpacing: 1,
                                                    fontFamily: 'Sofi',
                                                    fontWeight: FontWeight.w700,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                SizedBox(height: 1.h),
                                                SizedBox(
                                                  width: 45.w,
                                                  child: TextFormField(
                                                    controller: _bname,
                                                    decoration: InputDecoration(
                                                      hintText: 'Bride Name',
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: Colors.white,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(90),
                                                      ),
                                                      disabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color:
                                                                Colors.white),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(90),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color:
                                                                Colors.white),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(90),
                                                      ),
                                                      border:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color:
                                                                Colors.white),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(90),
                                                      ),
                                                      fillColor: Colors.white,
                                                      filled: true,
                                                      errorStyle: TextStyle(
                                                          fontSize: 12.sp,
                                                          fontFamily: 'sofi',
                                                          letterSpacing: 0.7,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    validator: (value) {
                                                      if (value!.isEmpty) {
                                                        return "Enter the Bride name";
                                                      } else {
                                                        return null;
                                                      }
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 3.h,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Phone : ",
                                              style: TextStyle(
                                                fontSize: 15.sp,
                                                letterSpacing: 1,
                                                fontFamily: 'Sofi',
                                                fontWeight: FontWeight.w700,
                                                color: Colors.black,
                                              ),
                                            ),
                                            SizedBox(height: 1.h),
                                            SizedBox(
                                              width: 95.w,
                                              child: TextFormField(
                                                controller: _phone,
                                                keyboardType:
                                                    TextInputType.number,
                                                decoration: InputDecoration(
                                                  hintText: 'Phone',
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Colors.white,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            90),
                                                  ),
                                                  disabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.white),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            90),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.white),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            90),
                                                  ),
                                                  border: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.white),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            90),
                                                  ),
                                                  fillColor: Colors.white,
                                                  filled: true,
                                                  errorStyle: TextStyle(
                                                      fontSize: 12.sp,
                                                      fontFamily: 'sofi',
                                                      letterSpacing: 0.7,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                validator: (value) {
                                                  if (value!.isEmpty) {
                                                    return "Enter Phone Number";
                                                  } else {
                                                    return null;
                                                  }
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 3.h,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Address : ",
                                              style: TextStyle(
                                                fontSize: 15.sp,
                                                letterSpacing: 1,
                                                fontFamily: 'Sofi',
                                                fontWeight: FontWeight.w700,
                                                color: Colors.black,
                                              ),
                                            ),
                                            SizedBox(height: 1.h),
                                            // Container(
                                            //   alignment: Alignment.topLeft,
                                            //   padding: EdgeInsets.only(
                                            //       left: 3.w,
                                            //       top: 1.2.h,
                                            //       right: 2.w),
                                            //   width: 95.w,
                                            //   height: 10.h,
                                            //   decoration: BoxDecoration(
                                            //     color: Colors.white,
                                            //     borderRadius:
                                            //         BorderRadius.circular(10),
                                            //     border: Border.all(
                                            //         color:
                                            //             Colors.grey.shade300),
                                            //     boxShadow: [
                                            //       BoxShadow(
                                            //         color: Colors.black26,
                                            //         // Color of the shadow
                                            //         offset: Offset(0, 3.5),
                                            //         // Offset of the shadow (x, y)
                                            //         blurRadius:
                                            //             8, // Spread of the shadow
                                            //         // How much the shadow extends
                                            //       ),
                                            //     ],
                                            //   ),
                                            //   child: TextFormField(
                                            //     cursorColor:
                                            //         Colors.grey.shade500,
                                            //     controller: _address,
                                            //     maxLines: 2,
                                            //     style: TextStyle(
                                            //       fontSize: 15.sp,
                                            //       letterSpacing: 1,
                                            //       fontFamily: 'Sofi',
                                            //       fontWeight: FontWeight.w700,
                                            //       color: Colors.grey.shade700,
                                            //     ),
                                            //     validator: (value) {
                                            //       if (value!.isEmpty) {
                                            //         return "Enter the address";
                                            //       } else {
                                            //         return null;
                                            //       }
                                            //     },
                                            //     decoration: inputDecoration(
                                            //         hint: "Address"),
                                            //   ),
                                            //   // Text(
                                            //   //   '147, Vitthalnagar, Bapa Sitaram chowk, Katargaam,Surat 395004',
                                            //   //   style: TextStyle(
                                            //   //     fontSize: 15.sp,
                                            //   //     letterSpacing: 1,
                                            //   //     fontFamily: 'Sofi',
                                            //   //     fontWeight: FontWeight.w700,
                                            //   //     height: 0.15.h,
                                            //   //     color: Colors.grey.shade700,
                                            //   //   ),
                                            //   // ),
                                            // ),
                                            SizedBox(
                                              width: 95.w,
                                              child: TextFormField(
                                                controller: _address,
                                                decoration: InputDecoration(
                                                  hintText: 'Address',
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Colors.white,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            90),
                                                  ),
                                                  disabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.white),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            90),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.white),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            90),
                                                  ),
                                                  border: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.white),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            90),
                                                  ),
                                                  fillColor: Colors.white,
                                                  filled: true,
                                                  errorStyle: TextStyle(
                                                      fontSize: 12.sp,
                                                      fontFamily: 'sofi',
                                                      letterSpacing: 0.7,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                validator: (value) {
                                                  if (value!.isEmpty) {
                                                    return "Enter Address";
                                                  } else {
                                                    return null;
                                                  }
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 3.h,
                                        ),
                                        Center(
                                          child: InkWell(
                                            onTap: () {
                                              updateprofileap();
                                            },
                                            child: Container(
                                              alignment: Alignment.center,
                                              height: 5.5.h,
                                              width: 45.w,
                                              decoration: BoxDecoration(
                                                  color: Colors.blue,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          90)),
                                              child: Text(
                                                'Update Profile',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 13.sp,
                                                  fontFamily: 'sofi',
                                                  fontWeight: FontWeight.bold,
                                                  letterSpacing: 2,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: isKeyboardOpen ? 37.h : 1.h,
                                        )
                                      ],
                                    ),
                                  ]),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ));
  }

  InputDecoration inputDecoration({
    required String hint,
  }) {
    return InputDecoration(
      focusedBorder: InputBorder.none, // Remove border when focused
      enabledBorder: InputBorder.none,
      hintText: hint,
      hintStyle: TextStyle(
        fontSize: 15.sp,
        letterSpacing: 1,
        fontFamily: 'Sofi',
        fontWeight: FontWeight.w700,
        color: Colors.black.withOpacity(0.8),
      ),
    );
  }

  updateprofileap() {
    if (_formKey.currentState!.validate()) {
      final Map<String, String> data = {};
      data['BrideName'] = _bname.text.trim().toString();
      data['GroomName'] = _gname.text.trim().toString();
      data['profile_img'] = _pickedFile != null ? _pickedFile!.path : "";
      data['Email'] = userData?.user?.email ?? "";
      data['phone'] = _phone.text.trim().toString();
      data['address'] = _address.text.trim().toString();
      print(data);
      checkInternet().then((internet) async {
        if (internet) {
          authprovider().updateprofileapi(data).then((response) async {
            updateprofile =
                UpdateprofileModal.fromJson(json.decode(response.body));
            if (response.statusCode == 200 && updateprofile?.status == "1") {
              print(updateprofile?.userDetails?.toString());
              buildErrorDialog1(
                context,
                "",
                updateprofile?.message ?? "",
                () {
                  print("ghfjhbfds");
                  Get.to(MyProfile());
                },
              );
            } else {
              buildErrorDialog(
                  context, " Error", (updateprofile?.message).toString());
            }
          });
        } else {
          buildErrorDialog(context, 'Error', "Internet Required");
        }
      });
    }
  }
}
