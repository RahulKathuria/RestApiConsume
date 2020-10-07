import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<DropdownMenuItem> dropDownList = new List();

  String result = "Hello";
  String _value = "M";
  int numberValue = 1;

  final myController = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    myController.dispose();
    super.dispose();
  }

  void initState() {
    for (int i = 1; i <= 100; i++) {
      dropDownList.add(DropdownMenuItem(
        child: Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text(
              i.toString(),
              style: TextStyle(color: Colors.black),
            )),
        value: i,
      ));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("REST API"),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 50,
          ),
          Expanded(
              child: Text(
            result,
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue),
          )),
          Expanded(
              flex: 1,
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.cyan,
                            border: Border.all()),
                        child: DropdownButton(
                            value: _value,
                            items: [
                              DropdownMenuItem(
                                child: Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Text(
                                      "Male",
                                      style: TextStyle(color: Colors.black),
                                    )),
                                value: "M",
                              ),
                              DropdownMenuItem(
                                child: Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Text("Female")),
                                value: "F",
                              )
                            ],
                            onChanged: (value) {
                              setState(() {
                                _value = value;
                              });
                            }),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.cyan,
                            border: Border.all()),
                        child: DropdownButton(
                            value: numberValue,
                            items: dropDownList,
                            onChanged: (value) {
                              setState(() {
                                numberValue = value;
                              });
                            }),
                      )
                    ],
                  ),
                ],
              )),
          Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
            controller: myController,
          ),
              )),
          Expanded(
            
            child:Container(
                          child: Align(
                alignment: Alignment.center,
                            child: Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.height * 0.1,
           
                  child: RaisedButton(
                      textColor: Colors.black,
                      child: Text("Submit"),
                      onPressed: () {}),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
