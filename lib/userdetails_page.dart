import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:gitthubb/utils/api.dart';
import 'package:http/http.dart' as http;

import 'models/user.dart';

class UserDetailsPage extends StatefulWidget {
  String username;
  UserDetailsPage({this.username});
  @override
  _UserDetailsPageState createState() => _UserDetailsPageState();
}

class _UserDetailsPageState extends State<UserDetailsPage> {


  User user;
  final str = Api.api;
  var _init = true;
  var _isloading = false;

  Future<void> getUserProfile(String username) async{
    final url = "${str}/users/${username}";

    try{

      final response = await http.get(Uri.parse(url));

      final responseData = json.decode(response.body)as Map<String,dynamic>;

      print(responseData['name']);
      user = User(
        username: responseData['login'],
        name : responseData['name'],
        imageUrl: responseData['avatar_url'],
        followers: responseData['followers'],
        following: responseData['following'],
        public_repo: responseData['public_repos'],
        joined_date: responseData['created_at'],
      );

      print(responseData['login']);
    }
    catch(e){
      print(e);
    }
  }


  @override
  void didChangeDependencies(){
    super.didChangeDependencies();
    if(_init){
      setState(() {
        _isloading=true;
      });

      getUserProfile(widget.username).then((_){
        setState(() {
          _isloading=false;
        });
      });

    }
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text(widget.username),
        backgroundColor: Color(0xff330033),
        centerTitle: true,
      ),
      body: _isloading?Center(child: CircularProgressIndicator()):Container(
        color: Colors.white60,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Image.network("${user.imageUrl.toString()}", height: 300, width: 300, alignment: Alignment.center,),
                      SizedBox(height: 10,),
                      Text("Userame: "+user.username.toString()),
                      Text("Name: "+user.name.toString()),
                      Text("Followers: "+user.followers.toString()),  //
                      Text("Following: "+user.following.toString()),  //
                      Text("Public Repositories: "+user.public_repo.toString()), //
                      Text("Joined at "+user.joined_date.toString()),
                    ],
                  ),
                ),
                margin: EdgeInsets.all(30),
                borderOnForeground: true,
                color: Colors.white10,
              ),
            ],
          ),
        ),
       ),
    );
  }
}
