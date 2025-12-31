import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkCall{
Future<Map<String,dynamic>> onCallServer({

  required String endPoint,
  required Map<String, dynamic> parameters,
  bool isPost = true,
  final response
})async{
  print("hitting server");
  try{
    http.Response response;
    Map<String, String> headers = {
      "Content-Type": "application/json",
    };
    if (isPost) {
      print("calling request");
      // response = await http.post(
      //   Uri.parse(endPoint),
      //   headers: headers,
      //   body: jsonEncode(parameters),
      // );
    response = await http.post(
          Uri.parse(endPoint),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(
         parameters
        ),
      );
    } else {
      response = await http.get(
        Uri.parse(endPoint),
        headers: headers,
      );
    }

    if (response.statusCode == 200) {
      print("hi");
      return jsonDecode(response.body);
    } else {
      return {
        "status": "failed",
        "message": "Server error ${response.statusCode}",
      };
    }
  } catch (e) {
    return {
      "status": "error",
      "message": e.toString(),
    };
  }
}
}