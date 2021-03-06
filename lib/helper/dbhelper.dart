import 'package:http/http.dart' as http;
import 'dart:convert';

class DbHelper {
  // variable
  var status;

  //get Data Dari API
  Future<List> getData() async {
    //alamat url
    String myUrl = 'https://backendapilaravel-app.herokuapp.com/api/product';
    //membuat object http request
    http.Response response = await http.get(Uri.parse(myUrl), headers: {
      'Accept': 'application/json',
    });
    return json.decode(response.body)['data'];
  }

  //add Data
  void addData(String nmproduct, String stock) async {
    String myUrl = 'https://backendapilaravel-app.herokuapp.com/api/product';
    http.post(Uri.parse(myUrl), headers: {
      'Accept': 'application/json',
    }, body: {
      'nmproduct': nmproduct,
      'stock': stock.toString(),
    }).then((response) {
      print('Status Code : ${response.statusCode}');
      print('body : ${response.body}');
    });
  }

  //delete
  void deleteData(int id) async {
    String myUrl =
        'https://backendapilaravel-app.herokuapp.com/api/product/$id';
    http.delete(Uri.parse(myUrl), headers: {
      'Accept': 'application/json',
    }).then((response){
      print('Delete: ${response.body}');
    });
  }
}
