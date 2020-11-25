import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CreatePage extends StatefulWidget {
  final User user;

  CreatePage(this.user);

  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final textEditingController = TextEditingController();
  File _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: _getImage,
        child: Icon(Icons.camera),
      ),
    );
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  Widget _buildAppBar() {
    return AppBar(
      actions: <Widget>[
        IconButton(
            icon: Icon(Icons.send),
            onPressed: () {
              final firebaseStorageRef = FirebaseStorage.instance
                  .ref()
                  .child('post')
                  .child('${DateTime.now().millisecondsSinceEpoch}.png');

              final task = firebaseStorageRef.putFile(
                  _image, SettableMetadata(contentType: 'image/png'));

              task.then((TaskSnapshot snapshot) {
                var downloadUrl = snapshot.ref.getDownloadURL();

                downloadUrl.then((uri) {
                  var doc = FirebaseFirestore.instance.collection('post').doc();
                  doc.set({
                    'id': doc.id,
                    'photoUrl': uri.toString(),
                    'contents': textEditingController.text,
                    'email': widget.user.email,
                    'displayName': widget.user.displayName,
                    'userPhotoUrl': widget.user.photoURL
                  }).then((value) {
                    Navigator.pop(context);
                  });
                });
              });
            })
      ],
    );
  }

  Widget _buildBody() {
    return Column(
      children: <Widget>[
        _image == null ? Text('No Image') : Image.file(_image),
        TextField(
          controller: textEditingController,
          decoration: InputDecoration(hintText: '내용을 입력하세요.'),
        )
      ],
    );
  }

  Future _getImage() async {
    File image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }
}
