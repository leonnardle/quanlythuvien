import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:thuctap/components/navbar.dart';
import 'package:thuctap/components/textfield.dart';
import 'package:thuctap/components/button.dart';

class EditAuthor extends StatefulWidget {
   EditAuthor({super.key});
   _EditAuthorState createState() => _EditAuthorState();
}
class _EditAuthorState extends State<EditAuthor> {
  //controller
  final TextEditingController nameauthorController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController storyController = TextEditingController();
 

  //butonadd
  void addAu(){

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        title: Text('Sửa Thông Tin Tác Giả'),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/31.png',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Container(
              padding: EdgeInsets.all(20),
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          'assets/images/logo.png',
                          width: 50,
                          height: 50,
                        ),
                        Text(
                          'Sửa Thông Tin Tác Giả',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.yellow[700],
                          ),
                        ),
                        SizedBox(width: 50), // Khoảng cách giữa logo và tiêu đề
                      ],
                    ),
                    SizedBox(height: 20), // Khoảng trống giữa tiêu đề và phần nhập thông tin
                    Container(
                      padding: EdgeInsets.all(20),
                    margin: EdgeInsets.symmetric(vertical: 50),
                  decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.circular(20), 
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text('Tên Tác Giả' , style: TextStyle(fontWeight: FontWeight.bold)),
                  MyTextField(controller: nameauthorController, hintText: 'Tên Tác Giả', obScureText: false),
                  const SizedBox(height: 10),
                  Text('Quê Quán', style: TextStyle(fontWeight: FontWeight.bold)),
                  MyTextField(controller: countryController, hintText: 'Quê Quán', obScureText: false),
                  Text('Thể Loại Truyện', style: TextStyle(fontWeight: FontWeight.bold)),
                  MyTextField(controller: storyController, hintText: 'Thể Loại Truyện', obScureText: false),
                  const SizedBox(height: 20),

                          MyButton(
                            onTap: addAu,
                            text: 'Sửa Thông Tin Tác Giả',
                          ),
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
    );
  }
}
