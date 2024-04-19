import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:thuctap/components/button.dart';
import 'package:thuctap/components/textfield.dart';
import 'package:thuctap/pages/regis.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key});

  // Controllers
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Sign in method
  void signIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent, 
      body: Stack(
        children: [
          // Background image
          Image.asset(
            "assets/images/31.png", 
            fit: BoxFit.cover, 
            width: double.infinity, 
            height: double.infinity, 
          ),
          // Content
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Your login content here
                    SizedBox(height: 50),
                   Image.asset(
                      "assets/images/logo.png",
                      width: 150,
                      height: 150,
                   ),
                    SizedBox(height: 50),
                    Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.yellow[800], // Màu của văn bản
                        fontSize: 50,
                      ),
                    ),
                    SizedBox(height: 25),
                    MyTextField(
                      controller: usernameController,
                      hintText: 'UserName',
                      obScureText: false,
                    ),
                    SizedBox(height: 25),
                    MyTextField(
                      controller: passwordController,
                      hintText: 'PassWord',
                      obScureText: true,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 200.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Quên Mật Khẩu ?',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    MyButton(
                      onTap: signIn,
                      text: 'Đăng Nhập',
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Regis()), // Chuyển hướng sang trang Regis
                        );
                      },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Chưa có tài khoản ? '),
                        SizedBox(width: 4),
                        Text(
                          'Đăng Ký Ngay',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    )
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
