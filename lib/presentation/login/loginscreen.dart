import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:levanhieu_project/configs/constanst/app_colors.dart';
import 'package:levanhieu_project/presentation/register/registerscreen.dart';
import 'package:levanhieu_project/presentation/widget/widget_button.dart';
import 'package:levanhieu_project/presentation/widget/widget_input.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(backgroundColor: Colors.white, body: buildWidget());
  }

  Widget buildWidget() {
    return SingleChildScrollView(
      child: Container(
        width: size.width,
        height: size.height,
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/logo.jpg',
            ),
            Spacer(flex: 1),
            WidgetInput(50, size.width, 'Username',
                Icon(Icons.person, color: BACKGROUND)),
            Spacer(flex: 1),
            WidgetInput(50, size.width, 'Password',
                Icon(Icons.lock, color: BACKGROUND)),
            SizedBox(height: 3),
            Spacer(flex: 2),
            WidgetButton(size.width, 50, 'Đăng nhập', BACKGROUND, null),
            Spacer(flex: 2),
            line(size),
            Spacer(flex: 1),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.facebook, color: BACKGROUND, size: 50),
                CircleAvatar(
                    radius: 22,
                    child: Text('G',
                        style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                    backgroundColor: BACKGROUND),
              ],
            ),
            Spacer(flex: 2),
            Expanded(child: register()),
            Spacer(flex: 4),
          ],
        ),
      ),
    );
  }

  Widget line(Size size) {
    return Row(
      children: [
        Expanded(
            child:
                Container(height: 1, width: size.width, color: Colors.black)),
        Text('  hoặc đăng nhập với  '),
        Expanded(
            child: Container(height: 1, width: size.width, color: Colors.black))
      ],
    );
  }

  Widget register() {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => RegisterScreen()));
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Bạn chưa có tài khoản? '),
          Text(
            'Đăng ký',
            style: TextStyle(color: BACKGROUND),
          )
        ],
      ),
    );
  }
}
