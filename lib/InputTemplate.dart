import 'package:flutter/material.dart';
import 'backend/DataWorker.dart';

import 'package:master_class/card.dart';
import 'main.dart';

class InputTemplate extends StatefulWidget{
  @override
  _InputTemplate createState() => _InputTemplate();
}
class _InputTemplate extends State<InputTemplate>{
  final myControllerDate = TextEditingController();
  final myControllerName = TextEditingController();
  final myControllerDescr = TextEditingController();
  

  @override
  Widget build(BuildContext context){
    return  Scaffold(
      appBar: AppBar(
        title: Text("Новая запись", style: TextStyle(color: Colors.white),),
          backgroundColor: Color(0x323232)      
      ),
      body: Column(
        children: <Widget>[
            TextField(
              decoration:InputDecoration(
                border: InputBorder.none,
                hintText: "Введите время"
              ),
              controller: myControllerDate,
            ),
            TextField(
              decoration:InputDecoration(
                border: InputBorder.none,
                hintText: "Введите имя"
              ),
              controller: myControllerName,
            ),
            TextField(
              decoration:InputDecoration(
                border: InputBorder.none,
                hintText: "Введите описание",
                hintMaxLines: 5
              ),
              controller: myControllerDescr,
            ),
        
          FlatButton(
            child: Text("Далее", style: TextStyle(color: Colors.white),),
            color: Colors.blue,
            onPressed: (){
               DataWorker.writeJSON(myControllerDate.text, myControllerName.text, myControllerDescr.text);
               Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TasksTemplate()) ,
              );
            },
          )
        ]
      )
    );
  }
}

main () => runApp(MaterialApp(home:InputTemplate()));
