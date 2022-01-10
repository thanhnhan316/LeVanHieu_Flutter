import 'dart:io';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:levanhieu_project/configs/constanst/app_colors.dart';
import 'package:levanhieu_project/presentation/details/detailsdcreen.dart';
import 'package:levanhieu_project/services/fetchdata.dart';

class UpdateDetailsScreen extends StatefulWidget {
  UpdateDetailsScreen({Key? key, required this.name, required this.image})
      : super(key: key);
  String name;
  String image;

  @override
  _HomeScreenState createState() => _HomeScreenState(name, image);
}

class _HomeScreenState extends State<UpdateDetailsScreen> {
  String name;
  String image;
  _HomeScreenState(this.name, this.image);
  late Size size;
  List<String> ls = FetchData().fetchDataChildren();
  File _image = File('file.txt');

  Future getImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image as File;
    });
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      body: buildWidget(),
    );
  }

  Widget buildWidget() {
    return SafeArea(
        child: _image != File('file.txt')
            ? Stack(
                children: [
                  Container(
                    color: BACKGROUND,
                    child: Column(
                      children: [
                        Container(
                          width: size.width,
                          height: size.height * 0.77,
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
                                  child: Text("Hoàn tác",
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
                                showSave();
                              },
                              child: Container(
                                  padding: EdgeInsets.all(size.height * 0.01),
                                  width: size.width * 0.3,
                                  height: size.height * 0.05,
                                  child: Text("Lưu",
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
                                builder: (context) =>
                                    DetailsScreen(name: name, image: image)));
                      },
                      icon: Icon(Icons.keyboard_arrow_left,
                          size: 35, color: BACKGROUND)),
                ],
              )
            : Image.file(_image));
  }

  Widget buildBody() {
    return Container(
      height: size.height,
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: size.height * 0.05),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                radius: size.height * 0.03,
                backgroundImage: NetworkImage(image),
                backgroundColor: Colors.cyan[100],
              ),
              IconButton(
                  onPressed: () {
                    getImage();
                  },
                  icon: Icon(Icons.add_a_photo, color: BACKGROUND))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("HỌ TÊN :  ${name}",
                  style: TextStyle(
                    fontSize: 22,
                    color: BACKGROUND,
                    fontWeight: FontWeight.bold,
                  )),
              IconButton(
                  onPressed: () {
                    show();
                  },
                  icon: Icon(Icons.edit, color: BACKGROUND))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("NGÀY SINH : 05/12/2019",
                  style: TextStyle(fontSize: 18, color: BACKGROUND)),
              IconButton(
                  onPressed: () {
                    show();
                  },
                  icon: Icon(Icons.edit, color: BACKGROUND))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("LỚP : Lớp lá",
                  style: TextStyle(fontSize: 18, color: BACKGROUND)),
              IconButton(
                  onPressed: () {
                    show();
                  },
                  icon: Icon(Icons.edit, color: BACKGROUND))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("NGÀY BẮT ĐẦU HỌC: 01/01/2022",
                  style: TextStyle(fontSize: 18, color: BACKGROUND)),
              IconButton(
                  onPressed: () {
                    show();
                  },
                  icon: Icon(Icons.edit, color: BACKGROUND))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("ĐỊA CHỈ: Phường Xuân phú",
                  style: TextStyle(fontSize: 18, color: BACKGROUND)),
              IconButton(
                  onPressed: () {
                    show();
                  },
                  icon: Icon(Icons.edit, color: BACKGROUND))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("CHIỀU CAO : 110 cm",
                  style: TextStyle(fontSize: 18, color: BACKGROUND)),
              IconButton(
                  onPressed: () {
                    show();
                  },
                  icon: Icon(Icons.edit, color: BACKGROUND))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("CÂN NẶNG: 20Kg",
                  style: TextStyle(fontSize: 18, color: BACKGROUND)),
              IconButton(
                  onPressed: () {
                    show();
                  },
                  icon: Icon(Icons.edit, color: BACKGROUND))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("HỌ TÊN BỐ: NGUYỄN XUÂN PHÚC",
                  style: TextStyle(fontSize: 18, color: BACKGROUND)),
              IconButton(
                  onPressed: () {
                    show();
                  },
                  icon: Icon(Icons.edit, color: BACKGROUND))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("HỌ TÊN MẸ: TRẦN THỊ A",
                  style: TextStyle(fontSize: 18, color: BACKGROUND)),
              IconButton(
                  onPressed: () {
                    show();
                  },
                  icon: Icon(Icons.edit, color: BACKGROUND))
            ],
          ),
        ],
      ),
    );
  }

  show() {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        content: TextFormField(
          decoration: InputDecoration(hintText: "Nguyễn Văn Hiếu"),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Hủy'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Thay đổi'),
          ),
        ],
      ),
    );
  }

  showSave() {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        content: Text("Xác nhận thay đổi"),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Hủy'),
          ),
          TextButton(
            onPressed: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        DetailsScreen(name: name, image: image))),
            child: const Text('Đồng ý'),
          ),
        ],
      ),
    );
  }
}
