import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gitthubb/userdetails_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'GittHubb',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        //  scaffoldBackgroundColor: Colors.black12,
        ),
        home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  TextEditingController _textEditingController = new TextEditingController();
  final GlobalKey<FormState> _formKey= GlobalKey();

  void submit(){
    if(!_formKey.currentState.validate()) {
        return;
    }
    Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=> UserDetailsPage(username: _textEditingController.text)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.black12,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 10, right: 10, bottom: 10, top: MediaQuery.of(context).size.height*0.3),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Image.network("https://cdn.iconscout.com/icon/free/png-256/github-156-675764.png", width: 150, height: 150,),
                SizedBox(height: 50,),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(
                    controller: _textEditingController,
                    style: TextStyle(color: Colors.grey),
                    validator: (value){
                      if(value.isEmpty){
                        return 'Please write something';
                      }
                    },
                    // onFieldSubmitted: (ctx){
                    //   submit();
                    // },
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      hintStyle: TextStyle(color: Colors.grey),
                      hintText: "Enter your github username",
                      border: InputBorder.none,
                    ),
                  ),
                ),

                SizedBox(height: 20,),

                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Color(0xff330033)
                  ),
                  child: FlatButton(
                    onPressed: (){
                      submit();
                    },
                    child: Text(
                      'Check',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
