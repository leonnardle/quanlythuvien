class Publisher {
  late String id;
  late String name;
  late String area;


  Publisher();

  factory Publisher.fromJson(Map<String, dynamic> data) {
    Publisher publisher = Publisher();
    publisher.id = data['manxb'] ?? '';
    publisher.name = data['tennxb'] ?? '';
    publisher.area = data['khuvuc'] ?? '';
    return publisher;
  }

}
