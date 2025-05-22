import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  var item = ["one", "two"];
  var output = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("TODO APP", style: TextStyle()),
      ),
      body: ListView.builder(
        itemCount: item.length,

        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(child: Text("${index + 1}")),
            title: Text(item[index]),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () {
                    mywidget(index);
                  },

                  child: Icon(Icons.edit),
                ),

                GestureDetector(
                  onTap: () {
                    setState(() {
                      item.removeAt(index);
                    });
                  },
                  child: Icon(Icons.delete),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          mywidget(null);
        },
        child: Icon(Icons.add),
      ),
    );
  }




  void mywidget(var myindex) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(myindex==null?"Enter your Task ": "Update your task"),
          content: TextField(
            onChanged: (value) {
              output = value;
            },
          ),

          actions: [
            ElevatedButton(
              onPressed: () {
                myindex == null
                    ? setState(() {
                      item.add(output);
                    })
                    : setState(() {
                      item.replaceRange(myindex, myindex + 1, {output});
                    });

                Navigator.of(context).pop();
              },
              child: myindex==null? Text("Add") : Text("Update"),
            ),
          ],
        );
      },
    );
  }
}
