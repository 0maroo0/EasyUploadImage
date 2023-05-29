<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

TODO: Put a short description of the package here that helps potential users
know whether this package might be useful for them.

## Features

A flutter package for web & android and ios for easy upload image with or without to sever and handling error 
## Getting started

## Usage

For android and ios
```dart
import 'package:flutter/material.dart';
import 'package:easyupload_image_toserver/easyupload_image_toserver_mob.dart';
class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    UploadImageforPhone upload = UploadImageforPhone();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: const Text(
          'test upload',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Center(
              child: MaterialButton(
                color: Colors.blue,
                onPressed: () {
                  // for gallery
                  upload.selectFromGallary();
                  // for gcamallery
                  upload.selectFromCam();
                },
                child: const Text('upload'),
              ),
            ),
            Center(
              child: MaterialButton(
                color: Colors.blue,
                onPressed: () {
                  //upload to server just image
                  upload.uploadToServerWithImageWithOnly(
                      'https://example.net/testupload.php', //link api
                      'file', // name of request image
                      {} //header if exist in api
                  );
                  upload.uploadToServerWithImageWithBody(
                      'https://example.net/testupload.php', //link api
                      'file', // name of request image
                      {"key": "value"}, //body of api
                      {} //header if exist in api
                  );
                },
                child: const Text('upload'),
              ),
            ),
          ],
        ),
      ),
    );
  }}
```

for web 
```dart 
import 'package:easyupload_image_toserver/easyupload_image_toserver.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    UploadImageforWeb upload = UploadImageforWeb();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: const Text(
          'test upload',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Center(
              child: MaterialButton(
                color: Colors.blue,
                onPressed: () {
                  // for gallery
                  upload.selectedImageFromWeb();
                },
                child: const Text('upload'),
              ),
            ),
            Center(
              child: MaterialButton(
                color: Colors.blue,
                onPressed: () {
                  //upload to server just image
                  upload.uploadFileToServer(
                      'https://example.net/testupload.php', //link api
                      'file', // name of request image
                      {} //header if exist in api
                      );
                  upload.uploadFileToServerWithBody(
                      'https://example.net/testupload.php', //link api
                      'file', // name of request image
                      {"key": "value"}, //body of api
                      {} //header if exist in api
                      );
                },
                child: const Text('upload'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
```

## Additional information

our GitHub
https://github.com/0maroo0/EasyUploadImage
our channel
https://www.youtube.com/@BemoCode
our facebook
https://www.facebook.com/BemoCode