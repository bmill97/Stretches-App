import 'package:sp/Stretch.dart';
import 'package:sp/StretchChip.dart';

import 'package:flutter/material.dart';

class StretchList extends StatefulWidget{

  final List<Stretch> stretches;
  final String searchTerm;
  final Function(Stretch stretch)? onItemClick;

  StretchList({required this.stretches, this.searchTerm = "", this.onItemClick});

  @override
  State<StatefulWidget> createState() {
    return StretchListState();
  }

}

class StretchListState extends State<StretchList>{

  String searchTerm = "";
  List<Stretch> stretches = [];
  List<Stretch> searchList = [];

  @override
  void initState() {
    super.initState();
    searchTerm = widget.searchTerm;
    filterStretch();
    sortStretch();
  }

  void sortStretch(){
    searchList.sort((a, b) =>
        a.name.compareTo(b.name));
    setState(() {});
  }

  void filterStretch() {
    stretches = [];
    setState((){});
    stretches = widget.stretches.toList();
    if (searchTerm.isEmpty) {
      searchList = [];
      searchList = stretches;
      return;
    }

    // Exhaustive Search, consider improving for non-prototype release
    searchList = [];
    setState(() {});
    searchList = stretches.where((stretch) => stretch.name.toLowerCase().contains(searchTerm.toLowerCase())).toList();

    // Sort After Search
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        for(Stretch stretch in searchList) StretchChip(
          key: ObjectKey(stretch.id),
          stretch: stretch.clone(),
          onClick: (Stretch stretch){
            if (widget.onItemClick != null){
              widget.onItemClick!(stretch);  // Asserts non-null
            }
          },
        ),
      ],
    );
  }

  void update(String s) {
    searchTerm = s;
    filterStretch();
    sortStretch();
    setState(() {});
  }

}