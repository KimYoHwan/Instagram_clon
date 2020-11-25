import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clon/craete_page.dart';

class SearchPage extends StatefulWidget {
  final User user;

  SearchPage(this.user);
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>CreatePage(widget.user)));
        },
        child: Icon(Icons.create),
        backgroundColor: Colors.blue,
      ),

    );
  }

  Widget _buildBody() {
    return StreamBuilder(
      stream: Firestore.instance.collection('post').snapshots(), builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if(!snapshot.hasData){
          return Center(child: CircularProgressIndicator(),);
        }
        var items = snapshot.data ?.documents ?? [];
        return GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1.0,
          mainAxisSpacing: 1.0,
          crossAxisSpacing: 1.0,
        ), itemBuilder: (context,index){
          return _buildListItem(context,items[index]);
        },
          itemCount: items.length,);
    },

    );
  }

  Widget _buildListItem(BuildContext context,document) {
    return Image.network(document['photoUrl'],fit: BoxFit.cover,);
  }
}