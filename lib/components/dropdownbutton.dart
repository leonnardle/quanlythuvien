import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListItems extends StatefulWidget {
  final List items;
  final void Function(String?) onChanged;

  ListItems({Key? key, required this.items, required this.onChanged}) : super(key: key);

  @override
  _ListItemsState createState() => _ListItemsState();
}

class _ListItemsState extends State<ListItems> {
  String? selectedLoan;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if(widget.items.isNotEmpty)
        DropdownButtonFormField<String>(
          onChanged: (newValue) {
            setState(() {
              selectedLoan = newValue;
              widget.onChanged(newValue);
            });
          },
          items: widget.items.map((loan) {
            return DropdownMenuItem<String>(
              value: loan,
              child: Text(loan),
            );
          }).toList(),

          isExpanded: true,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }
}
