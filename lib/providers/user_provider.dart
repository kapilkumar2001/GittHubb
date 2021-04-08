import 'package:flutter/cupertino.dart';
import 'package:gitthubb/models/user.dart';
import 'package:gitthubb/utils/api.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class UserProvider with ChangeNotifier{
  User user;

  final str = Api.api;

  Future<void> getUserProfile(String username) async{
    final url = "${str}/users/${username}";

    try{
      final response = await http.get(Uri.parse(url),headers: {'Authorization': 'token ${Api.token}'});

      final responseData = json.decode(response.body)as Map<String,dynamic>;

      print(responseData['name']);


      user = User(
        username: responseData['login'],
        imageUrl: responseData['avatar_url'],
        followers: responseData['followers'],
        following: responseData['following'],
        public_repo: responseData['public_repos'],
        joined_date: responseData['created_at'],
      );

      notifyListeners();
    }
    catch(e){
      print(e);
    }
  }
}