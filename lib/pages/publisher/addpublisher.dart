import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:thuctap/components/navbar.dart';
import 'package:thuctap/components/textfield.dart';
import 'package:thuctap/components/button.dart';
import 'package:thuctap/model/publisher.dart';
import 'package:thuctap/pages/publisher/publisherlist.dart';
import 'package:thuctap/rest/publisher_function.dart';

class AddPublisher extends StatefulWidget {
  AddPublisher({super.key});
  _AddPublisherState createState() => _AddPublisherState();
}

class _AddPublisherState extends State<AddPublisher> {
  //controller
  late TextEditingController manxbController = TextEditingController();
  late TextEditingController tennxbController = TextEditingController();
  late TextEditingController khuvucController = TextEditingController();

  //butonadd
  void addnxb()async{
    Publisher publisher=Publisher();
    publisher.id=manxbController.text;
    publisher.name=tennxbController.text;
    publisher.area=khuvucController.text;
    await insertPublisher(publisher);
    List<Publisher> items=await fetchPublishers();
    Navigator.push(context, MaterialPageRoute(builder: (context)=>ListPublisher(items: items)));
  }

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
          title: Text('Thêm Nhà Xuất Bản'),
      ),
      body: Stack( 
        children:[ Image.asset(
          'assets/images/31.png',
          fit: BoxFit.cover,
          width: double.infinity, 
          height: double.infinity,
          ),
          Positioned(
            top: 20, // Độ dời vị trí lên phía trên (20 pixels)
            left: 0, 
            right: 0, 
            child:Center(
            child: Text(
              'Thêm Nhà Xuất Bản',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.yellow[700],
                ),
            ),
            ),
          ),
          Positioned(
            top: 0, // Độ dời vị trí lên phía trên (20 pixels)
            left: 938, 
            right: 0, 
           child: Image.asset(
            'assets/images/logo.png',
            width: 50,
            height: 50,
            ),
          ), 
          Center(
            child: Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.symmetric(vertical: 50),
              decoration: BoxDecoration(
                color: Colors.blue[100],
                borderRadius: BorderRadius.circular(20), 
              ),
              
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Mã Nhà Xuất Bản' , style: TextStyle(fontWeight: FontWeight.bold)),
                  MyTextField(controller: manxbController, hintText: 'Mã Nhà Xuất bản', obScureText: false),
                  const SizedBox(height: 10),
                  Text('Tên Nhà Xuất Bản' , style: TextStyle(fontWeight: FontWeight.bold)),
                  MyTextField(controller: tennxbController, hintText: 'Tên Nhà Xuất bản', obScureText: false),
                  const SizedBox(height: 10),
                  Text('Khu Vực' , style: TextStyle(fontWeight: FontWeight.bold)),
                  MyTextField(controller: khuvucController, hintText: 'Tên Khu Vực', obScureText: false),
                  const SizedBox(height: 10),
                      MyButton(
              onTap: addnxb,
              text: 'Thêm Nhà Xuất Bản',
            )             
                ],
              ),
            ),
          ), 
          ], 
      ),
      );
  }
}