

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thuctap/pages/regis.dart';

import '../bloc/Login/login_bloc.dart';
import '../bloc/Login/login_event.dart';
import '../bloc/Login/login_state.dart';
import '../components/button.dart';
import '../components/textfield.dart';
import 'homepage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Controllers
  static String staticEmail = '';

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController(text: 'trungquocle636@gmail.com');
  final TextEditingController passwordController = TextEditingController(text: '05072002trung');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailController.addListener(() {
      setState(() {
        staticEmail=emailController.text;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body:
        Stack(
          children: [
            // Background image
            Image.asset(
              "images/31.png",
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            // Content
            SafeArea(
              child: Center(
                child:
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    const SizedBox(height: 50),
                    Image.asset(
                      "images/logo.png",
                      width: 150,
                      height: 150,
                    ),
                    const SizedBox(height: 50),
                    Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.yellow[800],
                        fontSize: 50,
                      ),
                    ),
                    Form(
                        key: _formkey,
                        child: Column(
                          children: [
                            MyTextField(
                              controller: emailController,
                              hintText: 'email',
                              obScureText: false,
                            ),
                            MyTextField(
                              controller: passwordController,
                              hintText: 'PassWord',
                              obScureText: true,
                            ),
                          ],
                        )),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 200.0),
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
                      onTap: (){
                        BlocProvider.of<LoginBloc>(context).add(LoginButtonPressed(emailController.text, passwordController.text));
                        final state=BlocProvider.of<LoginBloc>(context).state;
                        if(state is LoginSuccess){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> MyHomePage(name: emailController.text,)));
                        }
                      },
                      text: 'Đăng Nhập',
                    ),

                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Regis()), // Chuyển hướng sang trang Regis
                        );
                      },
                      child: const Row(
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
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
