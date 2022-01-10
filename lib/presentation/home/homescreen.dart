import 'dart:ui';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:levanhieu_project/configs/constanst/app_colors.dart';
import 'package:levanhieu_project/presentation/information/informationscreen.dart';
import 'package:levanhieu_project/presentation/login/loginscreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Size size;
  List<String> LsImage = [
    "https://www.baoquangbinh.vn/dataimages/201712/original/images617475_mn_12_q3_1513057101810_1513060489148.png",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ0yXa7htSgbVKwwe59KjnfMj73bASanMKeS_rQYzGcWM7CuaLUT1w37VVPhDm_UZc1lBc&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlHIpVEQ_Zh4WGRFPh7OIgTpwasleAIYKAFHhO33fn0ftIbpFwcQSHGgA5ZdamoTiPsgY&usqp=CAU"
  ];
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      body: buildWidget(),
    );
  }

  Widget buildWidget() {
    return Stack(
      children: [
        Container(
            width: size.width,
            height: size.height * 0.2,
            decoration: BoxDecoration(
                color: BACKGROUND,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30)))),
        buildContent()
      ],
    );
  }

  Widget buildContent() {
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        children: [
          SizedBox(height: size.height * 0.03),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: 20),
              Text("Thông tin lý lịch trẻ em",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold)),
              IconButton(
                  onPressed: () {
                    show();
                  },
                  icon: Icon(Icons.logout, size: 27, color: Colors.white))
            ],
          ),
          SizedBox(height: size.height * 0.015),
          Container(
            height: 40,
            width: size.width * 0.8,
            child: TextField(
              decoration: InputDecoration(
                  hintText: "tìm kiếm",
                  prefixIcon: Icon(Icons.search),
                  border: InputBorder.none),
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.white),
          ),
          SizedBox(height: size.height * 0.1),
          CarouselSlider.builder(
              itemCount: LsImage.length,
              itemBuilder:
                  (BuildContext context, int index, int pageViewIndex) {
                return Image.network(
                  LsImage[index],
                  height: size.height * 0.2,
                  width: size.width,
                  fit: BoxFit.fitHeight,
                );
              },
              options: CarouselOptions(
                height: size.height * 0.2,
              )),
          SizedBox(height: size.height * 0.05),
          listClass("Lớp Mầm", "Lớp Chồi"),
          SizedBox(height: size.height * 0.02),
          listClass("Lớp Lá", "Tất Cả")
        ],
      ),
    );
  }

  show() {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        content: Text("Đăng xuất"),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Hủy'),
          ),
          TextButton(
            onPressed: () => Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => LoginScreen())),
            child: const Text('Đồng ý'),
          ),
        ],
      ),
    );
  }

  Widget listClass(String Str1, String Str2) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [BtnClass(Str1), BtnClass(Str2)],
    );
  }

  Widget BtnClass(String str) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => InfomationScreen()));
      },
      child: Card(
        color: Colors.transparent,
        elevation: 20,
        child: Container(
          height: size.height * 0.12,
          width: size.width * 0.35,
          child: Center(
              child: Text(str,
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold))),
          decoration: BoxDecoration(
              color: BACKGROUND, borderRadius: BorderRadius.circular(20)),
        ),
      ),
    );
  }
}
