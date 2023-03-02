import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_data/screen/model/stuModel.dart';
import 'package:student_data/screen/provider/home_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController txtid = TextEditingController();
  TextEditingController txtname = TextEditingController();
  TextEditingController txtstd = TextEditingController();

  TextEditingController dtxtName = TextEditingController();
  TextEditingController dtxtid = TextEditingController();
  TextEditingController dtxtstd = TextEditingController();
  HomeProvider? homeProvider;

  @override
  Widget build(BuildContext context) {
    homeProvider = Provider.of<HomeProvider>(context, listen: false);
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(
          "Student Details",
          style: TextStyle(fontSize: 18, letterSpacing: 2),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey.shade600,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                  hintText: "Enter ur grid",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.amber.shade300,
                  ))),
              controller: txtid,
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "Enter ur Name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.amber.shade300,
                )),
              ),
              controller: txtname,
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              decoration: InputDecoration(
                  hintText: "Enter ur Std",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.amber.shade300,
                  ))),
              controller: txtstd,
            ),
            SizedBox(
              height: 20,
            ),
            FloatingActionButton(
              backgroundColor: Colors.amber.shade300,
              onPressed: () {
                stuModel s1 = stuModel(
                  id: txtid.text,
                  name: txtname.text,
                  std: txtstd.text,
                );
                homeProvider!.addData(s1);
              },
              child: Text(
                "Add",
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
            ),
            Consumer<HomeProvider>(
              builder: (context, value, child) => Expanded(
                child: ListView.builder(
                  itemCount: homeProvider!.l1.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Text("${homeProvider!.l1[index].id}"),
                      title: Text("${homeProvider!.l1[index].name}"),
                      subtitle: Text("${homeProvider!.l1[index].std}"),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () {
                              dtxtName = TextEditingController(
                                  text: homeProvider!.l1[index].name);
                              dtxtid = TextEditingController(
                                  text: homeProvider!.l1[index].id);
                              dtxtstd = TextEditingController(
                                  text: homeProvider!.l1[index].std);
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      TextField(
                                        controller: dtxtid,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      TextField(
                                        controller: dtxtName,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      TextField(
                                        controller: dtxtstd,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          stuModel s1 = stuModel(
                                              std: dtxtstd.text,
                                              name: dtxtName.text,
                                              id: dtxtid.text);
                                          homeProvider!.updateData(index, s1);
                                          Navigator.pop(context);
                                        },
                                        child: Text("update"),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                            icon: Icon(Icons.edit,color: Colors.purple.shade100,),
                          ),
                          IconButton(
                              onPressed: () {
                                homeProvider!.delete(index);
                              },
                              icon: Icon(
                                Icons.delete,
                                color: Colors.red,
                              )),
                        ],
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
