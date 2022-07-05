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
}
