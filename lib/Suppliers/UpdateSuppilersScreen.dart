import 'dart:convert';
import 'dart:io';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';

import '../Modal/AllCatagoriesModal.dart';
import '../Modal/SupplierdetailModal.dart';
import '../Modal/UpdateRequestedSupplierModal.dart';
import '../Modal/mySupplierModal.dart';
import '../Provider/taskprovider.dart';
import '../widgets/buildErrorDialog.dart';
import '../widgets/const.dart';
import '../widgets/drawer.dart';
import '../widgets/headerwidget.dart';
import 'ReqestventSuppliersscreen.dart';

class UpdateSuppilersScreen extends StatefulWidget {
  String? suppid;
  String? catid;

  UpdateSuppilersScreen({
    super.key,
    required this.suppid,
    required this.catid,
  });

  @override
  State<UpdateSuppilersScreen> createState() => _UpdateSuppilersScreenState();
}

class _UpdateSuppilersScreenState extends State<UpdateSuppilersScreen> {
  bool _obscurePassword = true;
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _passwod = TextEditingController();
  TextEditingController _confrompassword = TextEditingController();
  TextEditingController _contact = TextEditingController();
  TextEditingController _details = TextEditingController();
  final GlobalKey<ScaffoldState> scaffoldKey28 = GlobalKey<ScaffoldState>();
  String? category;
  final _formKey = GlobalKey<FormState>();
  ImagePicker _picker = ImagePicker();
  File? _pickedFile;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    CategApi();
    homeap();
    supplierdetailap();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      key: scaffoldKey28,
      drawer: drawer1(),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 1.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 6.h,
                ),
                header(
                    text: "Edit Supplier Details",
                    callback1: () {
                      scaffoldKey28.currentState?.openDrawer();
                    }),
                SizedBox(
                  height: 3.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Select Category :- ",
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontFamily: 'get',
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                            color: Colors.blue),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 1.5.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 90.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(width: 1, color: Colors.white),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      padding: EdgeInsets.symmetric(
                          horizontal: 5.0, vertical: 0.5.h),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton2(
                          hint: Text(
                            'Select Category',
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.4),
                                fontSize: 13.sp,
                                fontFamily: "task"),
                          ),
                          // Not necessary for Option 1
                          value: category,
                          onChanged: (newValue) {
                            setState(() {
                              category = newValue.toString();
                            });
                          },
                          items: allcat?.services?.map((location) {
                            return DropdownMenuItem(
                              child: Text(
                                (location.categoryName).toString(),
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontFamily: 'task',
                                    fontSize: 14.sp),
                              ),
                              value: location.categoryId,
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 1.5.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Suppliers Name :- ",
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontFamily: 'get',
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                            color: Colors.blue),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 1.5.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 90.w,
                      child: TextFormField(
                        controller: _name,
                        decoration: InputDecoration(
                          hintText: 'Enter Suppliers Name',
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
                          if (value!.isEmpty) {
                            return "Enter the Suppliers name";
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 1.5.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Suppliers Email :-",
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontFamily: 'get',
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                            color: Colors.blue),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 1.5.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                          String p = "[a-zA-Z0-9\+\.\_\%\-\+]{1,256}" +
                              "\\@" +
                              "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}" +
                              "(" +
                              "\\." +
                              "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}" +
                              ")+";
                          //Convert string p to a RegEx
                          RegExp regExp = RegExp(p);
                          if (value!.isEmpty) {
                            return 'Please enter your email';
                          } else {
                            //If email address matches pattern
                            if (regExp.hasMatch(value)) {
                              return null;
                            } else {
                              //If it doesn't match
                              return 'Email is not valid';
                            }
                          }
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 1.5.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Suppliers Contact :- ",
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontFamily: 'get',
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                            color: Colors.blue),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 1.5.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 90.w,
                      child: TextFormField(
                        controller: _contact,
                        decoration: InputDecoration(
                          hintText: 'Enter Suppliers Contact',
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
                          if (value!.isEmpty) {
                            return "Enter the Suppliers name";
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 1.5.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Suppliers Details :- ",
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontFamily: 'get',
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                            color: Colors.blue),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 1.5.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 90.w,
                      child: TextFormField(
                        controller: _details,
                        maxLines: 5,
                        decoration: InputDecoration(
                          hintText: 'Enter Suppliers Details',
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(20),
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
                          if (value!.isEmpty) {
                            return "Enter the Suppliers name";
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 1.5.h,
                ),
                // Padding(
                //   padding: EdgeInsets.symmetric(horizontal: 3.w),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.start,
                //     children: [
                //       Text(
                //         "Password :- ",
                //         style: TextStyle(
                //             fontSize: 16.sp,
                //             fontFamily: 'get',
                //             fontWeight: FontWeight.bold,
                //             letterSpacing: 1,
                //             color: Colors.blue),
                //       ),
                //     ],
                //   ),
                // ),
                // SizedBox(
                //   height: 1.5.h,
                // ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     SizedBox(
                //       width: 90.w,
                //       child: TextFormField(
                //         obscureText: _obscurePassword,
                //         controller: _passwod,
                //         decoration: InputDecoration(
                //           hintText: 'Enter Password',
                //           enabledBorder: OutlineInputBorder(
                //             borderSide: BorderSide(color: Colors.white),
                //             borderRadius: BorderRadius.circular(90),
                //           ),
                //           disabledBorder: OutlineInputBorder(
                //             borderSide: BorderSide(color: Colors.white),
                //             borderRadius: BorderRadius.circular(90),
                //           ),
                //           focusedBorder: OutlineInputBorder(
                //             borderSide: BorderSide(color: Colors.white),
                //             borderRadius: BorderRadius.circular(90),
                //           ),
                //           border: OutlineInputBorder(
                //             borderSide: BorderSide(color: Colors.white),
                //             borderRadius: BorderRadius.circular(90),
                //           ),
                //           fillColor: Colors.white,
                //           filled: true,
                //           errorStyle: TextStyle(
                //               fontSize: 12.sp,
                //               fontFamily: 'sofi',
                //               letterSpacing: 0.7,
                //               fontWeight: FontWeight.bold),
                //           suffixIcon: IconButton(
                //             icon: Icon(
                //                 _obscurePassword
                //                     ? Icons.visibility_outlined
                //                     : Icons.visibility_off_outlined,
                //                 color: Colors.grey),
                //             onPressed: () {
                //               setState(() {
                //                 _obscurePassword = !_obscurePassword;
                //               });
                //             },
                //           ),
                //         ),
                //         validator: (value) {
                //           if (value == null || value.isEmpty) {
                //             return 'Please enter your Password';
                //           }
                //           return null;
                //         },
                //       ),
                //     ),
                //   ],
                // ),
                // SizedBox(
                //   height: 1.5.h,
                // ),
                // Padding(
                //   padding: EdgeInsets.symmetric(horizontal: 3.w),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.start,
                //     children: [
                //       Text(
                //         "Conform Password :- ",
                //         style: TextStyle(
                //             fontSize: 16.sp,
                //             fontFamily: 'get',
                //             fontWeight: FontWeight.bold,
                //             letterSpacing: 1,
                //             color: Colors.blue),
                //       ),
                //     ],
                //   ),
                // ),
                // SizedBox(
                //   height: 1.5.h,
                // ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     SizedBox(
                //       width: 90.w,
                //       child: TextFormField(
                //         obscureText: _obscurePassword,
                //         controller: _confrompassword,
                //         decoration: InputDecoration(
                //           hintText: 'Enter Conform Password',
                //           enabledBorder: OutlineInputBorder(
                //             borderSide: BorderSide(color: Colors.white),
                //             borderRadius: BorderRadius.circular(90),
                //           ),
                //           disabledBorder: OutlineInputBorder(
                //             borderSide: BorderSide(color: Colors.white),
                //             borderRadius: BorderRadius.circular(90),
                //           ),
                //           focusedBorder: OutlineInputBorder(
                //             borderSide: BorderSide(color: Colors.white),
                //             borderRadius: BorderRadius.circular(90),
                //           ),
                //           border: OutlineInputBorder(
                //             borderSide: BorderSide(color: Colors.white),
                //             borderRadius: BorderRadius.circular(90),
                //           ),
                //           fillColor: Colors.white,
                //           filled: true,
                //           errorStyle: TextStyle(
                //               fontSize: 12.sp,
                //               fontFamily: 'sofi',
                //               letterSpacing: 0.7,
                //               fontWeight: FontWeight.bold),
                //           suffixIcon: IconButton(
                //             icon: Icon(
                //                 _obscurePassword
                //                     ? Icons.visibility_outlined
                //                     : Icons.visibility_off_outlined,
                //                 color: Colors.grey),
                //             onPressed: () {
                //               setState(() {
                //                 _obscurePassword = !_obscurePassword;
                //               });
                //             },
                //           ),
                //         ),
                //         validator: (value) {
                //           if (value == null || value.isEmpty) {
                //             return 'Please enter your Conform Password';
                //           }
                //           return null;
                //         },
                //       ),
                //     ),
                //   ],
                // ),
                // SizedBox(
                //   height: 1.5.h,
                // ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Select Photo :- ",
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontFamily: 'get',
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                            color: Colors.blue),
                      ),
                      InkWell(
                        onTap: () async {
                          XFile? photo = await _picker.pickImage(
                              source: ImageSource.gallery);
                          setState(() {
                            _pickedFile = File(photo!.path);
                          });
                        },
                        child: Container(
                          height: 6.h,
                          width: 50.w,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(25.sp),
                          ),
                          child: Text(
                            "Select Photo",
                            style: TextStyle(
                                fontSize: 16.sp,
                                fontFamily: 'get',
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 1.5.h,
                ),
                Row(
                  children: [
                    _pickedFile == null
                        ? Container()
                        : Container(
                            height: 14.5.h,
                            width: 40.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.file(
                                  _pickedFile!,
                                  fit: BoxFit.cover,
                                )),
                          ),
                  ],
                ),
                SizedBox(
                  height: 3.h,
                ),
                InkWell(
                  onTap: () {
                    requsetsuppiler();
                  },
                  child: Container(
                    width: 90.w,
                    height: 6.h,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(25.sp),
                    ),
                    child: Center(
                        child: Text(
                      "Update Supplier",
                      style: TextStyle(
                          fontSize: 17.sp,
                          color: Colors.white,
                          fontFamily: 'get'),
                    )),
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  CategApi() {
    checkInternet().then((internet) async {
      if (internet) {
        taskprovider().categoryapi1().then((response) async {
          allcat = AllCatagoriesModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200 && allcat?.status == "1") {
            print('done ');
            setState(() {
              isLoad = false;
            });
          } else {
            setState(() {
              isLoad = false;
            });
          }
        });
      } else {
        buildErrorDialog(context, 'Error', "Internet Required");
        setState(() {
          isLoad = false;
        });
      }
    });
  }

  bool isLoad = true;

  requsetsuppiler() {
    if (_formKey.currentState!.validate()) {
      final Map<String, String> data = {};
      data['name'] = _name.text.trim().toString();
      data['email'] = _email.text.trim().toString();
      data['phone'] = _contact.text.trim().toString();
      data['p_img'] = _pickedFile != null ? _pickedFile!.path : "";
      data['password'] ="";
      data['categoryId'] = category.toString();
      data['category_detail'] = _details.text.trim().toString();
      print(data);
      checkInternet().then((internet) async {
        if (internet) {
          taskprovider()
              .updatesulierapi(data, (widget.suppid).toString())
              .then((response) async {
            updaterequestedsuppliermodal =
                UpdateRequestedSupplierModal.fromJson(
                    json.decode(response.body));
            if (response.statusCode == 200 &&
                updaterequestedsuppliermodal?.status == "1") {
              buildErrorDialog1(
                context,
                "",
                updaterequestedsuppliermodal?.message ?? "",
                () {
                  Get.offAll(ReqestventSupplierscreen(sele: 0));
                },
              );
            } else {
              buildErrorDialog(context, " Error",
                  (updaterequestedsuppliermodal?.message).toString());
            }
          });
        } else {
          buildErrorDialog(context, 'Error', "Internet Required");
        }
      });
    }
  }

  homeap() {
    checkInternet().then((internet) async {
      if (internet) {
        taskprovider().Mysups().then((response) async {
          mysupps = MySuppliersModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200 && mysupps?.status == "1") {
            setState(() {
              isLoading = false;
            });
          } else {
            setState(() {
              isLoading = false;
            });
          }
        });
      } else {
        buildErrorDialog(context, 'Error', "Internet Required");
      }
    });
  }

  bool isLoading = true;

  supplierdetailap() {
    checkInternet().then((internet) async {
      if (internet) {
        taskprovider()
            .supplierdetailapi(widget.suppid, widget.catid)
            .then((response) async {
          supplierdetailmodal =
              SupplierdetailModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200 &&
              supplierdetailmodal?.status == "1") {
            _email.text = (supplierdetailmodal?.supplierInfo?.email).toString();
            _name.text = (supplierdetailmodal?.supplierInfo?.name).toString();
            _details.text =
                (supplierdetailmodal?.supplierInfo?.description).toString();
            _contact.text =
                (supplierdetailmodal?.supplierInfo?.contact).toString();

            setState(() {
              isLoading = false;
            });
          } else {
            setState(() {
              isLoading = false;
            });
          }
        });
      } else {
        buildErrorDialog(context, 'Error', "Internet Required");
      }
    });
  }
}
