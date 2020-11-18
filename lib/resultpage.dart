import 'package:flutter/material.dart';
import 'package:quizstar/home.dart';
import 'package:quizstar/reviewpage.dart';

class resultpage extends StatefulWidget {
  var random_array;
  var selected_awnser;
  var mydata;
  resultpage({Key key ,@required this.mydata, @required this.selected_awnser, @required this.random_array}) : super(key : key);
  @override
  _resultpageState createState() => _resultpageState(mydata, selected_awnser,random_array);
}

class _resultpageState extends State<resultpage> {

  List<String> images = [
    "images/success.png",
    "images/good.png",
    "images/bad.png",
  ];

  String message;
  String image;
  int marks = 0;

  Color bg = Color.fromRGBO(28, 120, 223, 1);

  @override
  void initState(){
    for(int j=0;j<10;j++){
      int i = random_array[j];
      String k = selected_awnser[j];
      if (mydata[2][i.toString()] == mydata[1][i.toString()][k]) {
          marks = marks + 1;
      }
    }

    if(marks < 4){
      image = images[2];
      message = "You Should Try Hard..\n" + "You Scored $marks";
    }else if(marks < 8){
      image = images[1];
      message = "You Can Do Better..\n" + "You Scored $marks";
    }else{
      image = images[0];
      message = "You Did Very Well..\n" + "You Scored $marks";
    }
    super.initState();
  }

  var random_array;
  var selected_awnser;
  var mydata;
  _resultpageState(this.mydata, this.selected_awnser, this.random_array);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Result",
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: Container(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 15.0,
                    ),
                    child: Center(
                    child: Text(
                      "Your Score ",
                      style: TextStyle(
                        fontSize: 22.0,
                        fontFamily: "Quando",
                      ),
                    ),
                  )
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.check,color: Colors.green,size: 40,),
                      Text(
                        "  :  "+marks.toString(),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.clear,color: Colors.red,size: 40,),
                      Text(
                        " :  "+(10-marks).toString(),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),            
          ),
          Expanded(
            flex: 4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                OutlineButton(
                  onPressed: (){
                    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                        homepage()), (Route<dynamic> route) => false);
                  },
                  child: Text(
                    "Home",
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 25.0,
                  ),
                  borderSide: BorderSide(width: 3.0, color: bg),
                  splashColor: bg,
                ),
                OutlineButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => reviewpage(mydata: mydata, selected_awnser: selected_awnser, random_array:random_array),
                    ));
                  },
                  child: Text(
                    "Review Questions",
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 25.0,
                  ),
                  borderSide: BorderSide(width: 3.0, color: bg),
                  splashColor: bg,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}