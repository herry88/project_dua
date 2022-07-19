import 'package:flutter/material.dart';
import 'package:project_dua/helper/dbhelper.dart';
import 'package:project_dua/screen/dashboard.dart';

class DetailPage extends StatefulWidget {
  List? list;
  int index;

  DetailPage({Key? key, this.list, required this.index}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  DbHelper _dbHelper = DbHelper();

  void confirm(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Are you Sure ?'),
            content: const Text('Do you want to delete this item ?'),
            actions: [
              TextButton(
                onPressed: () {
                  _dbHelper.deleteData(widget.list![widget.index]['id']);
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => DashBoardPage(),
                    ),
                  );
                },
                child:const Text('Yes'),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          widget.list![widget.index]['nmproduct'],
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Card(
          elevation: 5.0,
          margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Nama Produk: ${widget.list![widget.index]['nmproduct']}",
                  style: const TextStyle(
                    fontSize: 20.0,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('Edit'),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                      ),
                      child: const Text(
                        'Delete',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
