import 'package:flutter/material.dart';

class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Page'),
      ),
      body: Container(
        child: ListView(
          padding: const EdgeInsets.only(
            top: 20.0,
            left: 12.0,
            right: 12.0,
            bottom: 12.0,
          ),
          children: [
            Container(
              height: 50.0,
              child: TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Nama Produk',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            Container(
              height: 50.0,
              child: TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Nama Produk',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
            ),
            
          ],
        ),
      ),
    );
  }
}
