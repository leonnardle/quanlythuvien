import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:thuctap/components/navbar.dart';
import 'package:thuctap/components/textfield.dart';
import 'package:thuctap/components/button.dart';
import 'package:thuctap/rest/author_function.dart';
import 'package:thuctap/rest/booktype_function.dart';
import 'package:thuctap/rest/publisher_function.dart';

import '../../components/dropdownbutton.dart';
import '../../model/book.dart';
import '../../rest/book_function.dart';
import 'booklist.dart';

class EditBook extends StatefulWidget {
  Book book;
  EditBook({Key? key, required this.book}) : super(key: key);

  @override
  _EditBookState createState() => _EditBookState();
}

class _EditBookState extends State<EditBook> {
   late  TextEditingController namesachController ;
  late  TextEditingController authorController ;
  late  TextEditingController publisherController ;
  late  TextEditingController genreController ;
  late  TextEditingController detailController ;
  late  TextEditingController pictureEditBookController ;
   late List danhsachphieu=[];
   late List danhsachnhaxuatban=[];
   late List danhsachtacgia=[];

   late bool _isLoading = true;
    String? selectedloan,selectednhaxuatban,selectedtacgia;
  String? imageURL;
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
  void editBook() async {
    if (imageURL != null && imageURL!.isNotEmpty) {
      widget.book.name = namesachController.text;

      widget.book.description = detailController.text;
      widget.book.author = await updatenameAuthor(selectedtacgia!);
      widget.book.genre = await updateGenre(selectedloan!);
      widget.book.publisher = await updatenamePublisher(selectednhaxuatban!);

      widget.book.image = pictureEditBookController.text;
      await updateBook(widget.book);
      List<Book> bookList= await fetchBooks();
      Navigator.push(
          context, MaterialPageRoute(
          builder:(context) => ListBook(items: bookList,)
      )
      );
      // Thêm sách
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Lỗi'),
          content: Text('Vui lòng kiểm tra lại đường dẫn.'),
          actions: [
            TextButton(
              onPressed: ()  {
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
  void initState() {
    // TODO: implement initState
    super.initState();
    namesachController = TextEditingController(text: widget.book?.name);
    authorController = TextEditingController(text: widget.book?.author);
    publisherController = TextEditingController(text: widget.book?.publisher);
    genreController = TextEditingController(text: widget.book?.genre);
    detailController = TextEditingController(text: widget.book?.description);
    pictureEditBookController = TextEditingController(text: widget.book?.image);
    imageURL=pictureEditBookController.text;
    getList();
    getListPublisher();
    getListAuthor();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    namesachController.dispose();
    authorController.dispose();
    publisherController.dispose();
    genreController.dispose();
    detailController.dispose();
    pictureEditBookController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        title: Text('Sửa Thông Tin Sách'),
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
                          'Sửa Thông Tin Sách',
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
                            controller: pictureEditBookController,
                            hintText: 'Link Hình Ảnh',
                            obScureText: false,
                            onChanged: (value) {
                             setState(() {
                                // Kiểm tra xem đường dẫn có hợp lệ không
                                Uri? uri = Uri.tryParse(value);
                                if (uri != null && uri.isAbsolute) {
                                  imageURL = value;
                                } else {
                                  imageURL = null;
                                }
                              });
                            },
                          ),
                          const SizedBox(height: 10),
                          // Hiển thị hình ảnh nếu có
                          if (imageURL != null && imageURL!.isNotEmpty)
                            Image.network(
                              imageURL!,
                              height: 100,
                              width: 50,

                            ),
                          MyButton(
                            onTap: editBook,
                            text: 'Sửa Thông Tin Sách',
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
