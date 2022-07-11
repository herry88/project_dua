import 'package:flutter/material.dart';
import 'package:project_dua/helper/dbhelper.dart';

class DashBoardPage extends StatefulWidget {
  const DashBoardPage({Key? key}) : super(key: key);

  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  //memanggil class DbHelper
  DbHelper dbHelper = DbHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          //untuk delay data ke server
          await Future.delayed(
            const Duration(seconds: 5),
          );
          //kita panggil getData
          setState(() {
            dbHelper.getData();
          });
        },
        child: FutureBuilder<List>(
          future: dbHelper.getData(),
          builder: (context, snapshot) {
            return snapshot.hasData
                ? ItemList(list: snapshot.data)
                : const Text('Loading terus...');
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //halaman AddData
          // Navigator.of(context).push(
          //   MaterialPageRoute(
          //     builder: ((context) => AddPage()),
          //   ),
          // );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
} // Dashboard

class ItemList extends StatelessWidget {
  List? list; //array di dalam pemrogramn dart
  ItemList({Key? key, this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list == null ? 0 : list!.length, //operator ternary
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            title: Text(
              list![index]['nmproduct'],
            ),
          ),
        );
      },
    );
  }
}
