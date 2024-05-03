import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:thuctap/components/navbar.dart';
import 'package:thuctap/components/textfield.dart';
import 'package:thuctap/components/button.dart';
import 'package:thuctap/model/book.dart';
import 'package:thuctap/rest/book_function.dart';
import 'package:thuctap/rest/booktype_function.dart';

import '../../components/dropdownbutton.dart';
import '../../rest/author_function.dart';
import '../../rest/publisher_function.dart';
import 'booklist.dart';

class AddBook extends StatefulWidget {
  AddBook({Key? key});

  @override
  _AddBookState createState() => _AddBookState();
}

class _AddBookState extends State<AddBook> {
  final TextEditingController masachController = TextEditingController();
  final TextEditingController namesachController = TextEditingController();
  final TextEditingController authorController = TextEditingController();
  final TextEditingController publisherController = TextEditingController();
  final TextEditingController genreController = TextEditingController();
  final TextEditingController detailController = TextEditingController();
  final TextEditingController pictureAddBookController = TextEditingController();
  String? imageURL;
  late List danhsachphieu=[];
  late List danhsachnhaxuatban=[];
  late List danhsachtacgia=[];

  late bool _isLoading = true;
  String? selectedloan,selectednhaxuatban,selectedtacgia;
  void addSach() async{
    if (imageURL != null && imageURL!.isNotEmpty) {
      // Thêm sách
      Book book=Book();
      book.setId(masachController.text);
      book.setName(namesachController.text);
      book.author=await updatenameAuthor(selectedtacgia!);
      book.publisher=await updatenamePublisher(selectednhaxuatban!);
      book.genre=await updateGenre(selectedloan!);
      book.setDescription(detailController.text);
      book.setImage(pictureAddBookController.text);
      await insertBook(book);
      List<Book> bookList= await fetchBooks();
      Navigator.push(
          context, MaterialPageRoute(
          builder:(context) => ListBook(items: bookList,)
      )
      );
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
  void getList() async {

    try {
      _isLoading = true;
      danhsachphieu = await fetchtypeName();
      setState(() {
        _isLoading = false; // Đặt trạng thái tải dữ liệu thành false khi đã tải xong
      });
    } catch (e) {
      print('Error fetching loan id: $e');
    }
  }
  void getListPublisher() async {
    try {
      _isLoading = true;
      danhsachnhaxuatban = await fetchnamePublisher();
      setState(() {
        _isLoading = false; // Đặt trạng thái tải dữ liệu thành false khi đã tải xong
      });
    } catch (e) {
      print('Error fetching loan id: $e');
    }
  }
  void getListAuthor() async {
    try {
      _isLoading = true;
      danhsachtacgia = await fetchidAuthor();
      setState(() {
        _isLoading = false; // Đặt trạng thái tải dữ liệu thành false khi đã tải xong
      });
    } catch (e) {
      print('Error fetching loan id: $e');
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //get list for dropdown
    getList();
    getListPublisher();
    getListAuthor();
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
                          Text('ma Sách', style: TextStyle(fontWeight: FontWeight.bold)),
                          MyTextField(controller: masachController, hintText: 'ma Sách', obScureText: false),
                          Text('Tên Sách', style: TextStyle(fontWeight: FontWeight.bold)),
                          MyTextField(controller: namesachController, hintText: 'Tên Sách', obScureText: false),
                          const SizedBox(height: 10),
                          Text('Nhà Xuất Bản', style: TextStyle(fontWeight: FontWeight.bold)),
                          ListItems(items: danhsachnhaxuatban, onChanged: (newvalue){
                            for(int i=0;i<danhsachnhaxuatban.length;i++){
                              if(equal(danhsachnhaxuatban![i], newvalue)){
                                setState(() {
                                  selectednhaxuatban=newvalue;
                                });
                              }
                            }
                          },),
                          const SizedBox(height: 10),
                          Text('Tác Giả', style: TextStyle(fontWeight: FontWeight.bold)),
                          ListItems(items: danhsachtacgia, onChanged: (newvalue){
                            for(int i=0;i<danhsachtacgia.length;i++){
                              if(equal(danhsachtacgia![i], newvalue)){
                                setState(() {
                                  selectedtacgia=newvalue;
                                });
                              }
                            }
                          },),
                          const SizedBox(height: 10),
                          Text('Thể Loại', style: TextStyle(fontWeight: FontWeight.bold)),
                          ListItems(items: danhsachphieu, onChanged: (newvalue){
                            for(int i=0;i<danhsachphieu.length;i++){
                              if(equal(danhsachphieu![i], newvalue)){
                                setState(() {
                                  selectedloan=newvalue;
                                });
                              }
                            }
                          },),
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
                          const SizedBox(height: 10),
                          if (imageURL != null && imageURL!.isNotEmpty)
                          // ignore: curly_braces_in_flow_control_structures
                            Image.network(
                              imageURL!,
                              height: 100,
                              width: 50,

                            ),
                         
                          MyButton(
                            onTap: addSach,
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
