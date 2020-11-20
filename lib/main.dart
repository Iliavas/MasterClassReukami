import 'package:flutter/material.dart';
import 'backend/DataWorker.dart';
import 'backend/WidgetOfTask.dart';
import 'card.dart';
import 'InputTemplate.dart';

class TasksTemplate extends StatefulWidget{
  @override
  _TasksTemplate createState()=> _TasksTemplate();
}

class _TasksTemplate extends State<TasksTemplate>{
  bool isLoad = false;

  Widget build(BuildContext context){
    List<Widget> listOfStrings = new List();
    
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

    
    //listOfStrings.add(MyCard("gsdd","dmsds", "dssdsd"));
    for(WidgetOfTask i in listOfStrings){
        MyCard card = new MyCard(i.name, i.date, i.descr);
        listOfWidgets.add(card);
      }
      ListView myListView = ListView(children:listOfWidgets,);

      listOfWidgets.add(
      OutlineButton(
                onPressed: (){
                  setState(() {
                    isLoad = false;
                    getTasks();
                    Navigator.push(context, MaterialPageRoute(builder: (context) => InputTemplate()));
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
