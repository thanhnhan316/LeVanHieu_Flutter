import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:levanhieu_project/configs/constanst/app_colors.dart';
import 'package:levanhieu_project/presentation/details/detailsdcreen.dart';
import 'package:levanhieu_project/presentation/home/homescreen.dart';
import 'package:levanhieu_project/presentation/login/loginscreen.dart';
import 'package:levanhieu_project/services/fetchdata.dart';

class InfomationScreen extends StatefulWidget {
  const InfomationScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<InfomationScreen> {
  late Size size;
  List<String> ls = FetchData().fetchDataChildren();
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
        Column(
          children: [
            Container(
                width: size.width,
                height: size.height * 0.2,
                decoration: BoxDecoration(
                    color: BACKGROUND,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30))))
          ],
        ),
        buildContent()
      ],
    );
  }

  Widget buildContent() {
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        children: [
          SizedBox(height: size.height * 0.03),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  },
                  icon: Icon(Icons.keyboard_arrow_left,
                      size: 35, color: Colors.white)),
              Text("Danh sách trẻ em",
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
          SizedBox(height: size.height * 0.02),
          listDs()
        ],
      ),
    );
  }

  Widget listDs() {
    return Expanded(
      child: ListView.builder(
          itemCount: ls.length,
          itemBuilder: (context, index) {
            return buildCard(index);
          }),
    );
  }

  Widget buildCard(int index) {
    return Column(
      children: [
        Card(
          elevation: 5,
          child: Container(
            width: size.width,
            height: size.height * 0.07,
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(width: 30),
                  CircleAvatar(
                    radius: size.height * 0.027,
                    backgroundImage:
                        NetworkImage(FetchData().fetchDataImage()[index]),
                    backgroundColor: Colors.cyan[100],
                  ),
                  Expanded(child: Container()),
                  Text(ls[index],
                      style: TextStyle(
                          fontSize: 18,
                          color: BACKGROUND,
                          fontWeight: FontWeight.bold)),
                  Expanded(child: Container()),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailsScreen(
                                  name: ls[index],
                                  image: FetchData().fetchDataImage()[index])));
                    },
                    child: Container(
                        padding: EdgeInsets.all(size.height * 0.005),
                        width: size.width * 0.2,
                        height: size.height * 0.032,
                        child: Text("xem",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.red.shade500)),
                  ),
                  SizedBox(width: 30)
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 10)
      ],
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
}
