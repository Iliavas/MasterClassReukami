import 'package:flutter/material.dart';
import 'package:master_class/card.dart';
import 'backend.dart';
import 'card.dart';

class TasksTemplate extends StatefulWidget{
  @override
  _TasksTemplate createState()=> _TasksTemplate();
}

class _TasksTemplate extends State<TasksTemplate>{
  bool isLoad = false;

  Widget build(BuildContext context){
    List listOfStrings = new List();
    
    void getTasks(){
      if (!isLoad) {
        DataWorker.getTasks().then((e) {
          setState(() {
            isLoad=true;
            listOfStrings = e;
            print(listOfStrings);
            print("проверка");
          });
        });
      }
    }

    
    List<Widget> listOfWidgets = new List<Widget>();

    
    listOfWidgets.add(MyCard("gsdd","dmsds", "dssdsd"));
      // for(var i in listOfStrings){
      //   MyCard card = new MyCard("name", "name", "text");
      //   listOfWidgets.add(card);
      // }
      ListView myListView = ListView(children:listOfWidgets,);

      listOfWidgets.add(
      OutlineButton(
                onPressed: (){
                  setState(() {
                    isLoad = false;
                    getTasks();
                    Navigator.push(context, MaterialPageRoute(builder: (context) => App()));
                  });
                },
                child: Text("Добавить")
            )
          );

      return Scaffold(
        appBar: AppBar(
          title: Text("Список дел", style: TextStyle(color: Colors.white),),
          backgroundColor: Color(0x323232),
        ),
        body: myListView


      );
    }
}

main () => runApp(MaterialApp(home:TasksTemplate()));
