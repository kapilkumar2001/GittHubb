import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:gitthubb/providers/user_provider.dart';
import 'package:provider/provider.dart';

class UserDetailsPage extends StatefulWidget {
  String username;
  UserDetailsPage({this.username});
  @override
  _UserDetailsPageState createState() => _UserDetailsPageState();
}

class _UserDetailsPageState extends State<UserDetailsPage> {

  var _init = true;
  var _isloading = false;


  @override
  void didChangeDependencies(){
    super.didChangeDependencies();
    if(_init){
      setState(() {
        _isloading=true;


      });

      Provider.of<UserProvider>(context).getUserProfile(widget.username).then((_){
        setState(() {
          _isloading=false;
        });
      });

    }


  }

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.username),
        backgroundColor: Color(0xff330033),
        centerTitle: true,
      ),
      body: _isloading?Center(child: CircularProgressIndicator()):Container(
        child: Center(
          child: Column(
            children: [
              //Image.network("${user.user.imageUrl.toString()}"),
              SizedBox(height: 10,),
              Text("Username: "+user.user.username.toString()),
              Text("Followers: "),  //+user.user.followers.toString()
              Text("Following: "),  //+user.user.following.toString()
              Text("Public Repositories: "), //+user.user.public_repo.toString()
              Text("Joined at "),   //+user.user.joined_date.toString()
            ],
          ),
        )
      ),
    );
  }
}
