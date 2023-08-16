import 'package:flutter/material.dart';

class Categ2 extends StatefulWidget {
  const Categ2({super.key});

  @override
  State<Categ2> createState() => _Categ2State();
}

class cate {
  String? image;
  String? name;

  cate(
    this.image,
    this.name,
  );
}

List<cate> Categories = [
  cate('https://cdn-icons-png.flaticon.com/512/6491/6491166.png', 'Wedding'),
  cate('https://cdn-icons-png.flaticon.com/512/3436/3436370.png', 'Engagement'),
  cate(
      'https://cdn-icons-png.flaticon.com/512/6117/6117300.png', 'Anniversary'),
  cate('https://cdn-icons-png.flaticon.com/512/2454/2454313.png', 'Birthday'),
];

class _Categ2State extends State<Categ2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
