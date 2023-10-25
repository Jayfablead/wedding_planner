import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:wedding_planner/Guest/GuestList.dart';
import 'package:wedding_planner/Modal/AddguestModal.dart';
import 'package:wedding_planner/Modal/MyvenuetableModal.dart';
import 'package:wedding_planner/Provider/taskprovider.dart';
import 'package:wedding_planner/widgets/buildErrorDialog.dart';
import 'package:wedding_planner/widgets/const.dart';
import 'package:wedding_planner/widgets/drawer.dart';
import 'package:wedding_planner/widgets/headerwidget.dart';

import '../main.dart';

class Addguestlist extends StatefulWidget {
  int? sel1;

  Addguestlist({super.key, this.sel1});

  @override
  State<Addguestlist> createState() => _AddguestlistState();
}

class test {
  String title;
  String id;

  test(this.title, this.id);
}

class _AddguestlistState extends State<Addguestlist> {
  TextEditingController _name = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _relation = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  List<test> items = [];
  test? selectedItem;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tableapi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer1(),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.grey.shade100,
          ),
          child: Column(
            children: [
              SizedBox(height: 5.h),
              header(
                  text: "Add Guest",
                  callback1: () {
                    scaffoldKey.currentState?.openDrawer();
                  }),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 3.w),
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          widget.sel1 == 1
                              ? 'Add Bride\'s Guest'
                              : 'Add Groom\'s Guest',
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontFamily: 'sofi',
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1),
                        ),
                        SizedBox(height: 2.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 2.5.w),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Name :',
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontFamily: 'sofi',
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1),
                              ),
                              SizedBox(height: 1.h),
                              Container(
                                child: TextFormField(
                                  controller: _name,
                                  // controller: _search,
                                  onChanged: (value) {},
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Enter the guest name";
                                    }
                                    return null;
                                  },
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.67),
                                      fontFamily: 'Meta1'),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide.none,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide.none,
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide.none,
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintText: 'Guest Name',
                                    hintStyle: TextStyle(
                                        color: Colors.black.withOpacity(0.67),
                                        fontFamily: 'Meta1'),
                                  ),
                                ),
                              ),
                              SizedBox(height: 2.h),
                              Text(
                                'Phone :',
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontFamily: 'sofi',
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1),
                              ),
                              SizedBox(height: 1.h),
                              Container(
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  controller: _phone,
                                  // controller: _search,
                                  onChanged: (value) {},
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Enter the guest phone number";
                                    }
                                    return null;
                                  },
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.67),
                                      fontFamily: 'Meta1'),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide.none,
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide.none,
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide.none,
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintText: 'Guest Phone',
                                    hintStyle: TextStyle(
                                        color: Colors.black.withOpacity(0.67),
                                        fontFamily: 'Meta1'),
                                  ),
                                ),
                              ),
                              SizedBox(height: 2.h),
                              Text(
                                'Email :',
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontFamily: 'sofi',
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1),
                              ),
                              SizedBox(height: 1.h),
                              Container(
                                child: TextFormField(
                                  controller: _email,
                                  // controller: _search,
                                  onChanged: (value) {},
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Enter the guest email";
                                    }
                                    return null;
                                  },
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.67),
                                      fontFamily: 'Meta1'),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide.none,
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide.none,
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide.none,
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintText: 'Guest Email',
                                    hintStyle: TextStyle(
                                        color: Colors.black.withOpacity(0.67),
                                        fontFamily: 'Meta1'),
                                  ),
                                ),
                              ),
                              SizedBox(height: 2.h),
                              Text(
                                'Relation with bride/groom :',
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontFamily: 'sofi',
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1),
                              ),
                              SizedBox(height: 1.h),
                              Container(
                                child: TextFormField(
                                  controller: _relation,
                                  // controller: _search,
                                  onChanged: (value) {},
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Enter the relation with bride/groom";
                                    }
                                    return null;
                                  },
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.67),
                                      fontFamily: 'Meta1'),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide.none,
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide.none,
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide.none,
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintText: 'Relation',
                                    hintStyle: TextStyle(
                                        color: Colors.black.withOpacity(0.67),
                                        fontFamily: 'Meta1'),
                                  ),
                                ),
                              ),
                              SizedBox(height: 2.h),
                              Row(
                                children: [
                                  Text(
                                    'Select Table :',
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        fontFamily: 'sofi',
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1),
                                  ),
                                  SizedBox(width: 5.w),
                                  Column(
                                    children: [
                                      Container(
                                        width: 52.w,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 3.w, vertical: 0.5.h),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButton<test>(
                                            hint: Text("Select Table"),
                                            value: selectedItem,
                                            onChanged: (test? newValue) {
                                              setState(() {
                                                selectedItem =
                                                    newValue; // Update the selectedItem
                                              });
                                              // addguest();
                                            },
                                            items: items.map((test item) {
                                              return DropdownMenuItem<test>(
                                                value: item,
                                                child: Text(
                                                  item.title,
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                ),
                                              );
                                            }).toList(),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 2.h),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      addguestap();
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.all(2.5.w),
                                      decoration: BoxDecoration(
                                          color: Colors.blue,
                                          borderRadius:
                                              BorderRadius.circular(25)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            CupertinoIcons.add,
                                            size: 17.sp,
                                            color: Colors.white,
                                          ),
                                          SizedBox(
                                            width: 2.w,
                                          ),
                                          Text(
                                            'Add Guest',
                                            style: TextStyle(
                                                fontSize: 13.sp,
                                                fontFamily: 'sofi',
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                letterSpacing: 1),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 2.h),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  tableapi() {
    checkInternet().then((internet) async {
      if (internet) {
        taskprovider().myvenuetableapi().then((response) async {
          myvenuetablemodal =
              MyvenuetableModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200 && myvenuetablemodal?.status == "1") {
            for (int i = 0;
                i < int.parse((myvenuetablemodal?.data?.length).toString());
                i++) {
              items.add(test((myvenuetablemodal?.data?[i].name).toString(),
                  (myvenuetablemodal?.data?[i].id).toString()));
            }

            setState(() {
              print(items);
              items;
              // isLoading = false;
            });
          } else {
            // setState(() {
            //   isLoading = false;
            // });
          }
        });
      } else {
        buildErrorDialog(context, 'Error', "Internet Required");
      }
    });
  }

  addguestap() {
    if (_formKey.currentState!.validate() &&
        (selectedItem?.id != null || selectedItem?.id != "")) {
      final Map<String, String> data = {};
      data['guest_name'] = _name.text.toString();
      data['guest_email'] = _email.text.toString();
      data['guest_phone'] = _phone.text.toString();
      data['bride_or_groom'] = widget.sel1 == 1 ? "bride " : "groom";
      data['guest_relation'] = _relation.text.toString();
      data['guest_table_id'] = (selectedItem?.id).toString();
      data['guest_seat_no'] = "";
      print(data);
      checkInternet().then((internet) async {
        if (internet) {
          taskprovider().addguestapi(data).then((response) async {
            addguestmodal = AddguestModal.fromJson(json.decode(response.body));
            if (response.statusCode == 200 && addguestmodal?.status == "1") {
              print(addguestmodal?.message);
              _name.text = "";
              _phone.text = "";
              _email.text = "";
              _relation.text = "";

              Get.off(GuestList());
            } else {}
          });
        } else {
          buildErrorDialog(context, 'Error', "Internet Required");
        }
      });
    }
  }
// viewguestap() {
//   checkInternet().then((internet) async {
//     if (internet) {
//       taskprovider().viewguestapi().then((response) async {
//         viewguestmodal = ViewguestModal.fromJson(json.decode(response.body));
//         if (response.statusCode == 200 && viewguestmodal?.status == "1") {
//           viewguestap();
//           // setState(() {
//           //   isLoading = false;
//           // });
//         } else {
//           // setState(() {
//           //   isLoading = false;
//           // });
//         }
//       });
//     } else {
//       buildErrorDialog(context, 'Error', "Internet Required");
//     }
//   });
// }
}
