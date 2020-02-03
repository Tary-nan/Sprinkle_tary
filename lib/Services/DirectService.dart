// TODO : packages
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rxdart/rxdart.dart';


import 'package:sprinkle_architecture_tary/Models/DirectModel.dart';
import 'package:sprinkle_architecture_tary/Utils/Const.dart';

class DirectService {

  static Future<List<Direct>> browser({query})async {
    try {
      http.Response response = await http.get(
        "${Const.baseUrl}/direct/", headers: Const.requestHeaders,
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        Iterable<Direct> _cat = new List<Direct>.from(
            data.map((x) => Direct.fromJson(x)));
        //await Future.delayed(Duration(seconds: 1));

        if (query != null && query.isNotEmpty) {
          _cat = _cat.where(
                (direct) => direct.id.toString().contains(query),);
        }
        return _cat.toList();
      }
    } catch (error) {
      return null;
    }
  }


}

/*
void main()async{
  //var contact = await DirectService.browser(query: "");
  //print(contact.map((x)=> print(x.auteur.username)));
}
 */

