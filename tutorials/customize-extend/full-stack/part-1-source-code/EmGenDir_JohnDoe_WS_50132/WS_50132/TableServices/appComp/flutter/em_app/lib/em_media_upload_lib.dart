import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:em_app/em_global.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import 'package:permission_handler/permission_handler.dart';

//call via *_form.dart, then get value of fieldBase64Str from here
//https://stackoverflow.com/questions/49824461/how-to-pass-data-from-child-widget-to-its-parent

//typedef void FileCallback(File val);

class EmUploadFile extends StatefulWidget {
  //File localFile;
  Function(File) callback;
  //FileCallback? callback;

  EmUploadFile({Key? key, required this.callback}) : super(key: key);

  @override
  _EmUploadFileState createState() => _EmUploadFileState();
}

class _EmUploadFileState extends State<EmUploadFile> {
  File? image;
  //String bs4str = "";
  //File? byteImg;
  late PermissionStatus _cameraPermissionStatus;
  late PermissionStatus _storagePermissionStatus;
  String fieldBase64Str = "";

  Future getImage(var source, String mediaType) async {
    try {
      final tempImg;
      if (mediaType == "image") {
        tempImg = await ImagePicker().pickImage(source: source);
      } else {
        tempImg = await ImagePicker().pickVideo(source: source);
      }
      if (tempImg == null) return;

      final tempImgPath = File(tempImg.path);

      setState(() {
        image = tempImgPath;
      });

      //widget.callback = image;
    } on PlatformException catch (e) {
      // removed ignore print
      print(e);
    }
  }

  void getMediaFmCamera(BuildContext context, String mediaType) async {
    getImage(ImageSource.camera, mediaType);
    /*
    if (await Permission.camera.request().isGranted) {
      var _permissionSts = await Permission.camera.status;
      setState(() {
        _cameraPermissionStatus = _permissionSts;
      });
      var snackBar = SnackBar(
        content: Text(_cameraPermissionStatus.toString()),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      getImage(ImageSource.camera, mediaType);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Grant Permission for Camera")));
    }
    */
  }

  void isMediaPermissionGranted(BuildContext context, String mediaType) async {
    if (await Permission.storage.request().isGranted) {
      var _permissionSts = await Permission.storage.status;
      setState(() {
        _storagePermissionStatus = _permissionSts;
      });
      var snackBar = SnackBar(
        content: Text(_storagePermissionStatus.toString()),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      getImage(ImageSource.gallery, mediaType);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Grant Permission for Storage")));
    }
  }

  void chooseFileFmStorgaeUsingFilePicker() async {
    //-----pick file by file picker,

    var result = await FilePicker.platform.pickFiles(
        //withReadStream: true, // this will return PlatformFile object with read stream
        //withData: true, //default is true on web
        );
    if (result != null) {
      setState(() {
        image = File(result.files.single.path!);
      });
    }
  }

  Widget getFileUpLoadForField(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /* Image OR Video
            Text(
              "Image or Video:",
              style: TextStyle(
                  //fontSize: 17,
                  //fontWeight: FontWeight.w400,
                  color: Colors.grey.shade600),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  //typeOfMedia = "Image";
                });
              },
              icon: const Icon(Icons.image),
              //iconSize: 44,
              color: Colors.blue,
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  //typeOfMedia = "Video";
                });
              },
              icon: const Icon(Icons.video_call),
              //iconSize: 44,
              color: Colors.blue,
            ),

          */
            Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Select From Storage:",
                      style: TextStyle(
                          //fontSize: 17,
                          //fontWeight: FontWeight.w400,
                          color: Colors.grey.shade600),
                    ),
                    IconButton(
                      onPressed: () {
                        chooseFileFmStorgaeUsingFilePicker();
                        /*
                    isMediaPermissionGranted(
                        context, "image"); //This method asks for permission of storage and then calls getImage(ImageSource.gallery) to select an image from the gallery.
                        */
                      },
                      icon: const Icon(Icons.folder),
                      //iconSize: 44,
                      color: Colors.blue,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Select via Capture:",
                      style: TextStyle(
                          //fontSize: 17,
                          //fontWeight: FontWeight.w400,
                          color: Colors.grey.shade600),
                    ),
                    IconButton(
                      onPressed: () {
                        getMediaFmCamera(context,
                            "image"); // This  method asks for permission of camera and then calls getImage(ImageSource.camera)
                      },
                      icon: const Icon(Icons.camera),
                      //iconSize: 44,
                      color: Colors.blue,
                    ),
                    IconButton(
                      onPressed: () {
                        getMediaFmCamera(context,
                            "video"); // This  method asks for permission of camera and then calls getImage(ImageSource.camera)
                      },
                      icon: const Icon(Icons.video_camera_back),
                      //iconSize: 44,
                      color: Colors.blue,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            if (image != null) widget.callback(image!);
            Navigator.pop(context);
          },
          child: const Text("Select & Return"),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text("Selected File:"),
          ],
        ),
        const SizedBox(height: 10),
        if (image != null) showFileInfo(image!),
        const SizedBox(height: 10),
        //if (image != null) showMediaFile(image!) ,
      ],
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.blue.shade200,
        appBar: AppBar(
          title: const Text("Select File or Media"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: const BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: Colors.white,
                      ),
                    ], borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    width: MediaQuery.of(context).size.width *
                        0.95, //emFormFixedWidth,
                    //height: MediaQuery.of(context).size.height,
                    //width: formWidth ,
                    // height: 590,
                    //width: MediaQuery.of(context).size.width,
                    child: SingleChildScrollView(
                        child: getFileUpLoadForField(context)),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}

Widget showFileInfo(File? objFile) {
  return DataTable(
    headingRowHeight: 20,
    dataRowHeight: 80,
    columns: const <DataColumn>[
      DataColumn(label: Text("Path")),
    ],
    rows: <DataRow>[
      DataRow(
        cells: [
          DataCell(Text(objFile!.path)),
        ],
      ),
    ],
  );
}

Widget showMediaFile(File? image) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      image != null
          ? kIsWeb
              ? Image.network(image.path, height: 600, width: 800)
              : Image.file(
                  image,
                  height: 400,
                  width: 300,
                )
          : const Text("No image Selected"),
    ],
  );
}

class EmUploadFileWeb extends StatefulWidget {
  //File localFile;
  Function(PlatformFile) callback;
  //FileCallback? callback;

  EmUploadFileWeb({Key? key, required this.callback}) : super(key: key);

  @override
  _EmUploadFileWebState createState() => _EmUploadFileWebState();
}

class _EmUploadFileWebState extends State<EmUploadFileWeb> {
  PlatformFile? imageWeb;

  void chooseFileFmStorgaeUsingFilePicker() async {
    //-----pick file by file picker,

    var result = await FilePicker.platform.pickFiles(
        //withReadStream: true, // this will return PlatformFile object with read stream
        //withData: true, //default is true on web
        );
    if (result != null) {
      setState(() {
        imageWeb = result.files.single;
      });
    }
  }

  Widget getFileUpLoadForField(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Select From Storage:",
                      style: TextStyle(
                          //fontSize: 17,
                          //fontWeight: FontWeight.w400,
                          color: Colors.grey.shade600),
                    ),
                    IconButton(
                      onPressed: () {
                        chooseFileFmStorgaeUsingFilePicker();
                        /*
                    isMediaPermissionGranted(
                        context, "image"); //This method asks for permission of storage and then calls getImage(ImageSource.gallery) to select an image from the gallery.
                        */
                      },
                      icon: const Icon(Icons.folder),
                      //iconSize: 44,
                      color: Colors.blue,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    if (imageWeb != null) widget.callback(imageWeb!);
                    Navigator.pop(context);
                  },
                  child: const Text("Select & Return"),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text("Selected File:"),
                  ],
                ),
                const SizedBox(height: 10),
                if (imageWeb != null) showFileWebInfo(imageWeb!),
                const SizedBox(height: 10),
                //if (imageWeb != null) showMediaFileWeb(imageWeb!) ,
              ],
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.blue.shade200,
        appBar: AppBar(
          title: const Text("Select File - Web"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: const BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: Colors.white,
                      ),
                    ], borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    width: MediaQuery.of(context).size.width *
                        0.95, //emFormFixedWidth,
                    //height: MediaQuery.of(context).size.height,
                    //width: formWidth ,
                    // height: 590,
                    //width: MediaQuery.of(context).size.width,
                    child: SingleChildScrollView(
                        child: getFileUpLoadForField(context)),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}

Widget showFileWebInfo(PlatformFile? objFile) {
  return DataTable(
    headingRowHeight: 20,
    dataRowHeight: 80,
    columns: const <DataColumn>[
      DataColumn(label: Text("Name")),
    ],
    rows: <DataRow>[
      DataRow(
        cells: [
          DataCell(Text(objFile!.name)),
        ],
      ),
    ],
  );
}

Widget showMediaFileWeb(PlatformFile image) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      image != null
          ? Image.memory(image.bytes!, height: 600, width: 800)
          : const Text("No image Selected"),
    ],
  );
}


/*
  Future<void> convertToBytes() async {
    //if(image != null) {
    Uint8List imgbytes = await image!.readAsBytes();
    print("File Size:" + imgbytes.length.toString());
    String bs4strTemp = base64.encode(imgbytes);
    setState(() {
      //print(bs4strTemp);
      fieldBase64Str = bs4strTemp;
    });
    //}
    var snackBar = const SnackBar(
      content: Text("Processing File Upload ..."),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
*/