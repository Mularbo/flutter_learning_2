import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class UploadImageScreen extends StatefulWidget {
  const UploadImageScreen({Key? key}) : super(key: key);

  @override
  _UploadImageScreenState createState() => _UploadImageScreenState();
}

class _UploadImageScreenState extends State<UploadImageScreen> {
  File? image;
  final _picker = ImagePicker();
  bool showspinner = false;
  Future getimage() async {
    final pickedfile =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 80);
    if (pickedfile != null) {
      image = File(pickedfile.path);
      setState(() {});
    } else {
      print("no image selected");
    }
  }

  Future<void> uploadImage() async {
    setState(() {
      showspinner = true;
    });

    var stream = new http.ByteStream(image!.openRead());
    stream.cast();
    var length = await image!.length();
    var uri = Uri.parse('https://fakestoreapi.com/products');
    var request = new http.MultipartRequest("POST", uri);
    request.fields['title'] = "Static title";
    var multiport = new http.MultipartFile('image', stream, length);
    request.files.add(multiport);
    var response = await request.send();

    if (response.statusCode == 200) {
      setState(() {
        showspinner = false;
      });
      print("image loaded");
    } else {
      setState(() {
        showspinner = false;
      });
      print("image failed");
    }
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showspinner,
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: (() {
                getimage();
              }),
              child: Container(
                child: image == null
                    ? Center(
                        child: Text("pick image"),
                      )
                    : Container(
                        child: Center(
                            child: Image.file(
                          File(image!.path).absolute,
                          height: 100,
                          width: 100,
                          fit: BoxFit.cover,
                        )),
                      ),
              ),
            ),
            SizedBox(
              height: 150,
            ),
            GestureDetector(
              onTap: () {
                uploadImage();
              },
              child: Container(
                height: 50,
                width: double.infinity,
                color: Colors.green,
                child: Text("upload"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
