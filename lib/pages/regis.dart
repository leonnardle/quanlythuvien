import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:thuctap/components/button.dart';
import 'package:thuctap/components/textfield.dart';

class Regis extends StatelessWidget {
   Regis({super.key});

   void SignUp(){

   }
  

  //controller
  final usernameController = TextEditingController();
  final passworldController = TextEditingController();
  final numberController = TextEditingController();
  final addressController = TextEditingController();
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/31.png"), 
            fit: BoxFit.cover, 
          ),
        ),
      child:SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 10,),
                //text tieu de
                Text(
                  'Đăng Ký',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 40,
                  ),
                ),
                SizedBox( height: 30,),
                //username
                Text(
                  'Tên Đăng Nhập',
                  style: TextStyle(
                    fontSize: 20,
                  )
                ),
                const SizedBox(height: 10,),
                MyTextField(controller: usernameController,
                hintText: 'Username', 
                obScureText: false
                ),
                const SizedBox(height: 10,),
                Text(
                  'Mật Khẩu',
                  style: TextStyle(
                    fontSize: 20,
                  )
                ),
                const SizedBox(height: 10,),
                //passworld
                MyTextField(controller: passworldController,
                hintText: 'Passworld', 
                obScureText: true),
                const SizedBox(height: 10,),
                Text(
                  'Số Điện Thoại',
                  style: TextStyle(
                    fontSize: 20,
                  )
                ),
                //phone
                MyTextField(controller: numberController,
                hintText: 'Number', 
                obScureText: false),
                const SizedBox(height: 10,),
                Text(
                  'Email',
                  style: TextStyle(
                    fontSize: 20,
                  )
                ),
                //email
                MyTextField(controller: emailController,
                hintText: 'Email', 
                obScureText: false),
                const SizedBox(height: 10,),
                Text(
                  'Địa Chỉ',
                  style: TextStyle(
                    fontSize: 20,
                  )
                ),
                //adress
                MyTextField(controller: addressController,
                hintText: 'Adress', 
                obScureText: false),
                const SizedBox(height: 10),
                MyButton(
                  onTap: SignUp,
                  text: 'Đăng Ký',
                  )
              ],
              ),
          )
          )
      )
        )
    );
  }
}