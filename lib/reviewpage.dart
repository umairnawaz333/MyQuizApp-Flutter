import 'package:flutter/material.dart';

class reviewpage extends StatefulWidget {

  var random_array;
  var selected_awnser;
  var mydata;
  reviewpage({Key key ,@required this.mydata, @required this.selected_awnser, @required this.random_array}) : super(key : key);
  @override
  _reviewpageState createState() => _reviewpageState(mydata, selected_awnser,random_array);
}

class _reviewpageState extends State<reviewpage> with SingleTickerProviderStateMixin {

  Color colortoshow = Colors.indigoAccent;
  Color right = Colors.green[800];
  Color wrong = Colors.red;

  var random_array;
  var selected_awnser;
  var mydata;
  _reviewpageState(this.mydata, this.selected_awnser, this.random_array);

  PageController controller = PageController(initialPage: 0, keepPage: true, viewportFraction: 0.8);
  var currentPageValue = 0.0;
  double totalCards = 10;

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {
        currentPageValue = controller.page;
      });
    });

  }

  @override
  Widget build(BuildContext context) {
    // Navigator.pop(context);
    return new Scaffold(
      body: SafeArea(
        child: Container(
          child: Center(
            child: Container(
              height: 500,
              width: double.infinity,
              child: PageView.builder(
                itemCount: 10,
                itemBuilder: (context, i){
                  return Container(
                      margin: EdgeInsets.only(left: 5, top: 20, right: 5, bottom: 20),
                      decoration: new BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[350],
                            blurRadius: 2.0, // has the effect of softening the shadow
                            spreadRadius: 2.0, // has the effect of extending the shadow
                            offset: Offset(
                              0.0, // horizontal, move right 5
                              0.0, // vertical, move down 5
                            ),
                          )
                        ],
                        color: Colors.white,
                        borderRadius: new BorderRadius.circular(15.0),
                      ),
                      child: Container(
                        margin: EdgeInsets.only(top: 25, left: 25, right: 25, bottom: 15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                              child:Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      SizedBox(height: 10),
                                      Expanded(
                                        flex: 1,
                                        child: Text(mydata[0][random_array[i].toString()],
                                        style: TextStyle(
                                          fontSize: 18.0,
                                        ),),
                                      ),
                                      SizedBox(height: 20),
                                      Expanded(
                                        flex: 3,
                                        child: Column(
                                          children: [
                                            choicebutton('a',i),
                                            choicebutton('b',i),
                                            choicebutton('c',i),
                                            choicebutton('d',i),
                                          ],
                                        ),
                                      )
                                    ],

                                  ),
                            ),
                          ],
                        ),
                      )
                  );
                },
                controller: controller,
              ),
            ),
          ),
        ),
      )
    );
  }

  Widget choicebutton(String option, int i) {
    Color mycolor = colortoshow;

    if(mydata[1][random_array[i].toString()][option] == mydata[1][random_array[i].toString()][selected_awnser[i]]){
      mycolor = wrong;
    }
    if(mydata[1][random_array[i].toString()][option] == mydata[2][random_array[i].toString()]){
      mycolor = right;
      if(mydata[1][random_array[i].toString()][selected_awnser[i]] == null){
        mycolor = Colors.green[500];
      }
    }
    if(mydata[1][random_array[i].toString()][option] == mydata[1][random_array[i].toString()][selected_awnser[i]] && mydata[1][random_array[i].toString()][option] == mydata[2][random_array[i].toString()]){
      mycolor = right;
    }


    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 20.0,
      ),
      child: MaterialButton(
        onPressed: (){
        },
        child: Row(
          children: [
            Text(
              option.toUpperCase()+":      ",
              style: TextStyle(
                color: Colors.white,
                fontFamily: "Alike",
                fontSize: 18.0,
              ),
            ),
            Text(
              mydata[1][random_array[i].toString()][option],
              style: TextStyle(
                color: Colors.white,
                fontFamily: "Alike",
                fontSize: 14.0,
              ),
              maxLines: 1,
            ),
          ],
        ),
        color: mycolor,
        splashColor: mycolor,
        highlightColor: mycolor,
        minWidth: 200.0,
        height: 40.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      ),
    );
  }
}