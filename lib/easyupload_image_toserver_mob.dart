library easyupload_image_toserver;


import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

late File file;
//to make sure image selected or
int isSelected = 0;

/// METHOD Upload Image in Flutter From Web
/// Write By BemoCode
///
class UploadImageforPhone {
  /// selected from gallary
  selectFromGallary() async {
    try {
      XFile? xfile = await ImagePicker().pickImage(source: ImageSource.gallery);
      file = File(xfile!.path);
      // ignore: unnecessary_null_comparison
      if (file != null) {
        print('Image Selected');
        isSelected = 1;
      } else {
        print('Image Not Selected !');
      }
    } catch (e) {
      print(e);
    }
  }

  /// selected from CAMERA

  selectFromCam() async {
    try {
      XFile? xfile = await ImagePicker().pickImage(source: ImageSource.camera);
      file = File(xfile!.path);
      // ignore: unnecessary_null_comparison
      if (file != null) {
        print('Image Selected');
        isSelected = 1;
      } else {
        print('Image Not Selected !');
      }
    } catch (e) {
      print(e);
    }
  }

  /// Easy Upload toserver WITH body data

  uploadToServerWithImageWithBody(
      String url, String namerequstofImage, Map<String, String> body,
      [Map<String, String>? headers]) async {
    if (isSelected != 0) {
      var request = http.MultipartRequest("POST", Uri.parse(url));
      var length = await file.length();
      var Stream = http.ByteStream(file.openRead());
      var multipartfile = http.MultipartFile(namerequstofImage, Stream, length,
          filename: basename(file.path));
      request.files.add(multipartfile);

      // if there headers write that
      if (headers != null) {
        headers.forEach((key, value) {
          request.headers[key] = value;
        });
      } else {
        // nothing
      }
      body.forEach((key, value) {
        request.fields[key] = value;
      });
      var myrequest = await request.send();
      var response = await http.Response.fromStream(myrequest);
      if (myrequest.statusCode == 200) {
        print('File uploaded successfully');
      } else {
        print('File upload failed with status code: ${response.statusCode}');
      }
    } else {
      print('image Not Selected');
    }
  }

  /// Easy Upload toserver

  uploadToServerWithImageWithOnly(String url, String namerequstofImage,
      [Map<String, String>? headers]) async {
    if (isSelected != 0) {
      var request = http.MultipartRequest("POST", Uri.parse(url));
      var length = await file.length();
      var Stream = http.ByteStream(file.openRead());
      var multipartfile = http.MultipartFile(namerequstofImage, Stream, length,
          filename: basename(file.path));
      request.files.add(multipartfile);

      // if there headers write that
      if (headers != null) {
        headers.forEach((key, value) {
          request.headers[key] = value;
        });
      } else {
        // nothing
      }

      var myrequest = await request.send();
      var response = await http.Response.fromStream(myrequest);
      if (myrequest.statusCode == 200) {
        print('File uploaded successfully');
      } else {
        print('File upload failed with status code: ${response.statusCode}');
      }
    } else {
      print('image Not Selected');
    }
  }
}