import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AccountPage extends StatefulWidget {
  final User user;

  AccountPage(this.user);
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: _buildBody(),
    );
  }

  Widget _buildAppbar() {
    return AppBar(
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.exit_to_app),
          onPressed: () {
            FirebaseAuth.instance.signOut();
            _googleSignIn.signOut();
          },
        )
      ],
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  SizedBox(
                      width: 80.0,
                      height: 80.0,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://www.dogdrip.net/dvs/d/20/07/26/100517a3e6386e8b15b6589ef115d182.png'),
                      )),
                  Container(
                    width: 80,
                    height: 80,
                    alignment: Alignment.bottomRight,
                    child: Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        SizedBox(
                          width: 28,
                          height: 28,
                          child: FloatingActionButton(
                            onPressed: null,
                            backgroundColor: Colors.white,
                            child: Icon(Icons.add),
                          ),
                        ),
                        SizedBox(
                          width: 25,
                          height: 25,
                          child: FloatingActionButton(
                            onPressed: null,
                            backgroundColor: Colors.blue,
                            child: Icon(Icons.add),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Padding(padding: EdgeInsets.all(8),),
              Text(
                widget.user.displayName,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              )
            ],
          ),
          Text('0\n게시물',
              textAlign: TextAlign.center, style: TextStyle(fontSize: 18.0)),
          Text('0\n팔로워',
              textAlign: TextAlign.center, style: TextStyle(fontSize: 18.0)),
          Text(
            '0\n팔로잉',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18.0),
          ),
        ],
      ),
    );
  }
}
