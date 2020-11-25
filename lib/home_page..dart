import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final User user;
  HomePage(this.user);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          'Instagram Clon',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        )),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[
                Text('Instagram에 오신것을 환영합니다.',style: TextStyle(fontSize: 24),),
                Padding(padding: EdgeInsets.all(8),),
                Text('사진과 동영상을 보려면 팔로우 하세요.'),
                Padding(padding: EdgeInsets.all(16),),
                SizedBox(
                  width: 300.0,
                  child: Card(
                    elevation:5,
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Column(
                        children: <Widget>[
                          Padding(padding: EdgeInsets.all(8),),
                          SizedBox(
                            width: 80, height:80,
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(user.photoURL),
                            ),
                          ),
                          Padding(padding: EdgeInsets.all(8),),
                          Text(user.email,style: TextStyle(fontWeight: FontWeight.bold),),
                          Text(user.displayName),
                          Padding(padding: EdgeInsets.all(8),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(
                                width:70,
                                height: 70,
                                child: Image.network('https://www.dogdrip.net/dvs/d/20/07/26/100517a3e6386e8b15b6589ef115d182.png',fit:BoxFit.cover),
                              ),
                              Padding(padding: EdgeInsets.all(2),),
                              SizedBox(
                                width:70,
                                height: 70,
                                child: Image.network('https://www.dogdrip.net/dvs/d/20/07/26/100517a3e6386e8b15b6589ef115d182.png',fit:BoxFit.cover),
                              ),
                              Padding(padding: EdgeInsets.all(2),),
                              SizedBox(
                                width:70,
                                height: 70,
                                child: Image.network('https://www.dogdrip.net/dvs/d/20/07/26/100517a3e6386e8b15b6589ef115d182.png',fit:BoxFit.cover),
                              ),
                            ],
                          ),
                          Padding(padding: EdgeInsets.all(4),),
                          Text('FaceBook 친구'),
                          Padding(padding: EdgeInsets.all(4),),
                          RaisedButton(
                            onPressed: () {  },
                            child: Text('팔로우'),
                            color: Colors.blueAccent,
                            textColor: Colors.white,
                          ),
                          Padding(padding: EdgeInsets.all(8),),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
