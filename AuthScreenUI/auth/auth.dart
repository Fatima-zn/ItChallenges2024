import 'package:flutter_secure_storage/flutter_secure_storage.dart';

Future<Map<String, String>> getHeaders() async{
  const storage = FlutterSecureStorage();
  final token = await storage.read(key: "auth_token");
  return{
    'Authorization': "Bearer $token",
    'Content-Type': "application/json"
  };
}


