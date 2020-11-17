import 'package:flutter/material.dart';

class reviewpage extends StatefulWidget {
  var random_array;
  var selected_awnser;
  var mydata;
  reviewpage({Key key ,@required this.mydata, @required this.selected_awnser, @required this.random_array}) : super(key : key);
  @override
  _reviewpageState createState() => _reviewpageState(mydata, selected_awnser,random_array);
}

class _reviewpageState extends State<reviewpage> {

  var random_array;
  var selected_awnser;
  var mydata;
  _reviewpageState(this.mydata, this.selected_awnser, this.random_array);

  @override
  void initState() {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text(
        "Result",
    ),
    ),
    body: Column(
      children: [

    ],
    ),
    );
  }
}