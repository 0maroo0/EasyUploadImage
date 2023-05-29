library easyupload_image_toserver;


import 'dart:typed_data';
import 'package:file_picker/_internal/file_picker_web.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;

class UploadImageforWeb {
  FilePickerResult? imageBytes;

  /// METHOD Upload Image in Flutter From Web
  /// Write By BemoCode
  ///
  selectedImageFromWeb() async {
    imageBytes = await FilePickerWeb.platform.pickFiles();
    if (imageBytes != null) {
      print('Image Selected');
      return imageBytes;
    } else {
      print('Image Not Selected !');
    }
    return imageBytes;
  }

  /// METHOD Send Requset to Server
  /// Write By BemoCode
  uploadFileToServer(String url, String namerequstofImage,
      [Map<String, String>? headers]) async {
    if (imageBytes != null) {
      Uint8List? fileBytes = imageBytes!.files.first.bytes;
      String fileName = imageBytes!.files.first.name;

      var uri = Uri.parse(url);

      var request = http.MultipartRequest('POST', uri);
      var multipartFile = http.MultipartFile.fromBytes(
        namerequstofImage, // name req (can be file -image -......)
        fileBytes!,
        filename: fileName,
      );

      /// if there headers write that
      if (headers != null) {
        headers.forEach((key, value) {
          request.headers[key] = value;
        });
      } else {
        /// nothing
      }

      request.files.add(multipartFile);

      var response = await request.send();

      if (response.statusCode == 200) {
        print('File uploaded successfully');
      } else {
        print('File upload failed with status code: ${response.statusCode}');
      }
    } else {
      /// if image Not Selected
      print('image Not Selected');
    }
  }

  uploadFileToServerWithBody(
      String url, String namerequstofImage, Map<String, String> body,
      [Map<String, String>? headers]) async {
    if (imageBytes != null) {
      Uint8List? fileBytes = imageBytes!.files.first.bytes;
      String fileName = imageBytes!.files.first.name;

      var uri = Uri.parse(url);

      var request = http.MultipartRequest('POST', uri);
      var multipartFile = http.MultipartFile.fromBytes(
        namerequstofImage, // name req (can be file -image -......)
        fileBytes!,
        filename: fileName,
      );

      /// if there headers write that
      if (headers != null) {
        headers.forEach((key, value) {
          request.headers[key] = value;
        });
      } else {
        /// nothing
      }
      body.forEach((key, value) {
        request.fields[key] = value;
      });
      request.files.add(multipartFile);

      var response = await request.send();

      if (response.statusCode == 200) {
        print('File uploaded successfully');
      } else {
        print('File upload failed with status code: ${response.statusCode}');
      }
    } else {
      /// if image Not Selected
      print('image Not Selected');
    }
  }
}
