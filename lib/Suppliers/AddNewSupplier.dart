import 'dart:convert';
import 'dart:io';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';

import '../Modal/AllCatagoriesModal.dart';
import '../Modal/ReqsetsSuppliersModal.dart';
import '../Provider/taskprovider.dart';
import '../widgets/buildErrorDialog.dart';
import '../widgets/const.dart';
import '../widgets/drawer.dart';
import '../widgets/headerwidget.dart';
import 'ReqestventSuppliersscreen.dart';

class RequestSupplier extends StatefulWidget {
  const RequestSupplier({super.key});

  @override
  State<RequestSupplier> createState() => _RequestSupplierState();
}

class _RequestSupplierState extends State<RequestSupplier> {
  bool _obscurePassword = true;
  TextEditingController _name = TextEditingController();
  TextEditingController _cname = TextEditingController();
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
  List<XFile>? resultList;
  List<XFile>? resultList1;
  List<File> selectedImages = [];
  List<String> imagePaths = [];
  List<XFile> imagesList = <XFile>[];
  String _error = 'No Error Dectected';
  List<String> imageNames = [];
  ImagePicker _picker1 = ImagePicker();
  int maxImageLimit = 9;
  File? selectedimage;

  List<String> networkImageUrls = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    CategApi();
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
                    text: "Request Supplier",
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
                        "Company Name :- ",
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
                          hintText: 'Enter Company Name',
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
                            return "Enter the Company name";
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
                        "Contact Name :- ",
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
                        controller: _cname,
                        decoration: InputDecoration(
                          hintText: 'Enter Contact Name',
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
                            return "Enter the Contact name";
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
                        "Email :-",
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
                        "Phone no :- ",
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
                        "Category Details :- ",
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
                          hintText: 'Enter Category Details',
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
                            return "Enter the Category name";
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
                          resultList1 = await ImagePicker().pickMultiImage();
                          if (resultList1 != null) {
                            if (resultList1!.length + selectedImages.length >
                                maxImageLimit) {
                              // Handle maximum image limit exceeded
                            } else {
                              setState(() {
                                print(selectedImages);
                                selectedImages.addAll(resultList1!
                                    .map((XFile file) => File(file.path))
                                    .toList());
                                imagePaths = resultList1!
                                    .map((file) => file.path)
                                    .toList();
                              });
                            }
                          }
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
                SizedBox(
                    // height: 200.h,
                    width: 225.w,
                    child: Column(
                      children: [
                        //for first select
                        selectedImages.isEmpty
                            ? GridView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                padding: EdgeInsets.zero,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3),
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () async {
                                      resultList =
                                          await ImagePicker().pickMultiImage();

                                      if (resultList != null) {
                                        if (resultList!.length +
                                                selectedImages.length >
                                            maxImageLimit) {
                                          print('Maximum image limit exceeded');
                                        } else {
                                          setState(() {
                                            selectedImages = resultList!
                                                .map((XFile file) =>
                                                    File(file.path))
                                                .toList()!;
                                            imagePaths.addAll(resultList!
                                                .map((file) => file.path)
                                                .toList());
                                          });
                                        }
                                      }
                                    },
                                    child: Container(
                                      margin: EdgeInsets.all(3.w),
                                      height: 60.h,
                                      width: 70.w,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          border:
                                              Border.all(color: Colors.grey)),
                                    ),
                                  );
                                },
                                itemCount: 9,
                              )
                            : Container(),
                        selectedImages.isEmpty
                            ? Container()
                            :
                            //disply after first selection
                            GridView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                padding: EdgeInsets.zero,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3),
                                itemCount: 9,
                                itemBuilder: (context, index) {
                                  if (index < selectedImages.length &&
                                      selectedImages[index] != null) {
                                    return Stack(
                                      children: [
                                        Container(
                                            margin: EdgeInsets.all(3.w),
                                            height: 70.h,
                                            width: 70.w,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                border: Border.all(
                                                    color: Colors.grey)),
                                            child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                child: Image.file(
                                                    selectedImages[index],
                                                    height: 60.h,
                                                    width: 70.w,
                                                    fit: BoxFit.cover))),
                                        Positioned(
                                            left: 50.w,
                                            top: 10.h,
                                            child: GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  selectedImages
                                                      .removeAt(index);
                                                  imagePaths.removeAt(index);
                                                });
                                              },
                                              child: Container(
                                                  height: 15.w,
                                                  width: 15.w,
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: Colors.white),
                                                  child: Icon(
                                                    Icons.close,
                                                    size: 15.sp,
                                                  )),
                                            ))
                                      ],
                                    );
                                  } else {
                                    //remaining container
                                    return GestureDetector(
                                      onTap: () async {
                                        resultList1 = await ImagePicker()
                                            .pickMultiImage();
                                        if (resultList1 != null) {
                                          if (resultList1!.length +
                                                  selectedImages.length >
                                              maxImageLimit) {
                                            // Handle maximum image limit exceeded
                                            buildErrorDialog(
                                                context, "", "您选择的图像超过 9 张");
                                          } else {
                                            setState(() {
                                              print(selectedImages);
                                              selectedImages.addAll(resultList1!
                                                  .map((XFile file) =>
                                                      File(file.path))
                                                  .toList());
                                              imagePaths = resultList1!
                                                  .map((file) => file.path)
                                                  .toList();
                                            });
                                          }
                                        }
                                      },
                                      child: Container(
                                        margin: EdgeInsets.all(3.w),
                                        height: 60.h,
                                        width: 70.w,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            border:
                                                Border.all(color: Colors.grey)),
                                      ),
                                    );
                                  }
                                },
                              )
                      ],
                    )),
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
                      "Request Supplier",
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
      data['password'] = '123456';
      data['categoryId'] = category.toString();
      data['category_detail'] = _details.text.trim().toString();
      // data['c_img[]'] = _pickedFile != null ? _pickedFile!.path : "" ;
      print(data);
      checkInternet().then((internet) async {
        if (internet) {
          taskprovider()
              .requsestsuppiersapi(data, imagePaths)
              .then((response) async {
            reqsetssuppliersmodal =
                ReqsetsSuppliersModal.fromJson(json.decode(response.body));
            if (response.statusCode == 200 &&
                reqsetssuppliersmodal?.status == "1") {
              List<File> selectedImages = [];
              List<String> imagePaths = [];
              List<XFile> imagesList = <XFile>[];
              buildErrorDialog1(
                context,
                "",
                reqsetssuppliersmodal?.message ?? "",
                () {
                  Get.off(ReqestventSupplierscreen(sele: 0));
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
