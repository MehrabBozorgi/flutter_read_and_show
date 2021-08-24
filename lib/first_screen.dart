import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  FilePickerResult? result;

  var value;

  File? file;

  @override
  Widget build(BuildContext context) {
    // Future<void> getText() async {
    //   result = await FilePicker.platform.pickFiles(
    //     type: FileType.custom,
    //     allowedExtensions: ['txt'],
    //   );
    //   // print('===================================');
    //   // print('===================================');
    //   // print(
    //   //   result!.paths.asMap().toString().replaceAll('{', '').replaceAll('}', '').substring(3),
    //   // );
    // }
    //
    // //
    // Future<String?> _read() async {
    //   try {
    //     final Directory directory = await getApplicationDocumentsDirectory();
    //     final File file = File(
    //         "${result!.paths.asMap().toString().replaceAll('{', '').replaceAll('}', '').substring(4)}");
    //     text = await file.readAsString();
    //     print('===================================');
    //     print('===================================');
    //     print('===================================');
    //     print(text.toString());
    //   } catch (e) {
    //     print("Couldn't read file");
    //   }
    //   return text;
    // }
    Future<void> getFile() async {
      result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['txt'],
      );

      final Directory directory = await getApplicationDocumentsDirectory();
      file = File(
          "${result!.paths.asMap().toString().replaceAll('{', '').replaceAll('}', '').substring(4)}");
      var text = await file!.readAsString();
      print('===================================');
      print('===================================');
      print('===================================');
      print(file.toString());
      print(text.toString());
      setState(() {
        value = text;
      });
      print(text);
    }

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: IconButton(
              icon: Icon(
                Icons.event,
                size: 50,
              ),
              onPressed: () {
                getFile();
                print('===================================');

                print(value);
              },
            ),
          ),
          value == null
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Empty'),
                )
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(value.replaceAll(",", "\n")),
                ),
        ],
      ),
    );
  }
}
