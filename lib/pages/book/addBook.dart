import 'package:flutter/material.dart';
import 'package:thuctap/components/navbar.dart';
import 'package:thuctap/components/textfield.dart';
import 'package:thuctap/components/button.dart';

class AddBook extends StatefulWidget {
  AddBook({Key? key});

  @override
  _AddBookState createState() => _AddBookState();
}

class _AddBookState extends State<AddBook> {
  final TextEditingController namesachController = TextEditingController();
  final TextEditingController authorController = TextEditingController();
  final TextEditingController publisherController = TextEditingController();
  final TextEditingController genreController = TextEditingController();
  final TextEditingController detailController = TextEditingController();
  final TextEditingController pictureAddBookController = TextEditingController();
  String? imageURL;

  void addsach() {
    if (imageURL != null && imageURL!.isNotEmpty) {
      // Thêm sách
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Lỗi'),
          content: Text('Vui lòng kiểm tra lại đường dẫn.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        title: Text('Thêm Sách'),
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
                          'Thêm Sách',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.yellow[700],
                          ),
                        ),
                        SizedBox(width: 50),
                      ],
                    ),
                    SizedBox(height: 20),
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
                          Text('Tên Sách', style: TextStyle(fontWeight: FontWeight.bold)),
                          MyTextField(controller: namesachController, hintText: 'Tên Sách', obScureText: false),
                          const SizedBox(height: 10),
                          Text('Nhà Xuất Bản', style: TextStyle(fontWeight: FontWeight.bold)),
                          MyTextField(controller: publisherController, hintText: 'Nhà Xuất Bản', obScureText: false),
                          const SizedBox(height: 10),
                          Text('Tác Giả', style: TextStyle(fontWeight: FontWeight.bold)),
                          MyTextField(controller: authorController, hintText: 'Tác Giả', obScureText: false),
                          const SizedBox(height: 10),
                          Text('Thể Loại', style: TextStyle(fontWeight: FontWeight.bold)),
                          MyTextField(controller: genreController, hintText: 'Thể Loại', obScureText: false),
                          const SizedBox(height: 10),
                          Text('Chi Tiết', style: TextStyle(fontWeight: FontWeight.bold)),
                          MyTextField(controller: detailController, hintText: 'Chi Tiết', obScureText: false),
                          const SizedBox(height: 10),
                          Text('Hình Ảnh', style: TextStyle(fontWeight: FontWeight.bold)),
                          MyTextField(
                            controller: pictureAddBookController,
                            hintText: 'Link Hình Ảnh',
                            obScureText: false,
                            onChanged: (value) {
                              
                             setState(() {
                                // Kiểm tra xem đường dẫn có hợp lệ không
                                Uri? uri = Uri.tryParse(value);
                                if (uri != null && uri.isAbsolute) {
                                  // Nếu hợp lệ, gán vào imageURL
                                  imageURL = value;
                                   const SizedBox(height: 10);
                          // Hiển thị hình ảnh nếu có
                     
                          if (imageURL != null && imageURL!.isNotEmpty)
                            // ignore: curly_braces_in_flow_control_structures
                            Image.network(
                              imageURL!,
                              height: 100,
                              width: 50,
                          
                            );
                                } else {
                                  // Nếu không hợp lệ, gán imageURL thành null
                                  imageURL = null;
                                    Image.network(
                              '',
                              height: 100,
                              width: 50,
                          
                            );
                                }
                              });
                            },
                          ),
                         
                          MyButton(
                            onTap: addsach,
                            text: 'Thêm Sách',
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
