import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:levanhieu_project/configs/constanst/app_colors.dart';
import 'package:levanhieu_project/presentation/information/informationscreen.dart';
import 'package:levanhieu_project/presentation/updatedetails/updatedeitailsscreen.dart';
import 'package:levanhieu_project/services/fetchdata.dart';

class DetailsScreen extends StatefulWidget {
  DetailsScreen({Key? key, required this.name, required this.image})
      : super(key: key);
  String name;
  String image;

  @override
  _HomeScreenState createState() => _HomeScreenState(name, image);
}

class _HomeScreenState extends State<DetailsScreen> {
  String name;
  String image;
  _HomeScreenState(this.name, this.image);
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
    return SafeArea(
      child: Stack(
        children: [
          Container(
            color: BACKGROUND,
            child: Column(
              children: [
                Container(
                  width: size.width,
                  height: size.height * 0.75,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30))),
                  child: buildBody(),
                ),
                SizedBox(height: size.height * 0.05),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        show();
                      },
                      child: Container(
                          padding: EdgeInsets.all(size.height * 0.01),
                          width: size.width * 0.3,
                          height: size.height * 0.05,
                          child: Text("X??a",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.red)),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UpdateDetailsScreen(
                                    name: name, image: image)));
                      },
                      child: Container(
                          padding: EdgeInsets.all(size.height * 0.01),
                          width: size.width * 0.3,
                          height: size.height * 0.05,
                          child: Text("Ch???nh s???a",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 18,
                                  color: BACKGROUND,
                                  fontWeight: FontWeight.bold)),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white)),
                    )
                  ],
                )
              ],
            ),
          ),
          IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => InfomationScreen()));
              },
              icon:
                  Icon(Icons.keyboard_arrow_left, size: 35, color: BACKGROUND)),
        ],
      ),
    );
  }

  Widget buildBody() {
    return Container(
      height: size.height,
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: size.height * 0.05),
          Center(
            child: CircleAvatar(
              radius: size.height * 0.06,
              backgroundImage: NetworkImage(image),
              backgroundColor: Colors.cyan[100],
            ),
          ),
          SizedBox(height: size.height * 0.02),
          Text("H??? T??N :  ${name}",
              style: TextStyle(
                fontSize: 22,
                color: BACKGROUND,
                fontWeight: FontWeight.bold,
              )),
          SizedBox(height: size.height * 0.03),
          Text("NG??Y SINH : 05/12/2019",
              style: TextStyle(fontSize: 18, color: BACKGROUND)),
          SizedBox(height: size.height * 0.02),
          Text("L???P : L???p l??",
              style: TextStyle(fontSize: 18, color: BACKGROUND)),
          SizedBox(height: size.height * 0.02),
          Text("NG??Y B???T ?????U H???C: 01/01/2022",
              style: TextStyle(fontSize: 18, color: BACKGROUND)),
          SizedBox(height: size.height * 0.02),
          Text("?????A CH???: Ph?????ng Xu??n ph??",
              style: TextStyle(fontSize: 18, color: BACKGROUND)),
          SizedBox(height: size.height * 0.02),
          Text("CHI???U CAO : 110 cm",
              style: TextStyle(fontSize: 18, color: BACKGROUND)),
          SizedBox(height: size.height * 0.02),
          Text("C??N N???NG: 20Kg",
              style: TextStyle(fontSize: 18, color: BACKGROUND)),
          SizedBox(height: size.height * 0.02),
          Text("H??? T??N B???: NGUY???N XU??N PH??C",
              style: TextStyle(fontSize: 18, color: BACKGROUND)),
          SizedBox(height: size.height * 0.02),
          Text("H??? T??N M???: TR???N TH??? A",
              style: TextStyle(fontSize: 18, color: BACKGROUND)),
        ],
      ),
    );
  }

  show() {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        content: Text("X??c nh???n x??a tr??? em"),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('H???y'),
          ),
          TextButton(
            onPressed: () => Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => InfomationScreen())),
            child: const Text('?????ng ??'),
          ),
        ],
      ),
    );
  }
}
