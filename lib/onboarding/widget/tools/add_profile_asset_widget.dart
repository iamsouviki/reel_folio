import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../../../util/size_config.dart';



class AddProfileAssetWidget extends StatefulWidget {

  final ValueChanged<File> onUploadImage;

  const AddProfileAssetWidget({Key? key, required this.onUploadImage}) : super(key: key);

  @override
  State<AddProfileAssetWidget> createState() => _AddProfileAssetWidgetState();
}

class _AddProfileAssetWidgetState extends State<AddProfileAssetWidget> {

  File? file;

  final _imagePicker = ImagePicker();

  Ref? ref;

  getImage(ImageSource source) async {
    await _imagePicker.pickImage(source: source).then((value) {
      widget.onUploadImage(File(value!.path));
      Navigator.pop(context);
      //ref!.read(profileImageProvider.notifier).state = File(value!.path);
    });
  }

  Future openUploadImageDialogue(BuildContext context) async {
    return showCupertinoModalPopup(
        context: context,
        builder: (_) => CupertinoActionSheet(
          actions: [
            CupertinoActionSheetAction(
                onPressed: () async {
                  await getImage(ImageSource.camera);
                },
                child: const Text('TAKE PHOTO')),
            CupertinoActionSheetAction(
                onPressed: () async {
                  await getImage(ImageSource.gallery);
                },
                child: const Text('CHOOSE PHOTO')),
          ],
          cancelButton: CupertinoActionSheetAction(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              'CANCEL',
              style: TextStyle(
                color: Colors.red,
              ),
            ),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async{
        await openUploadImageDialogue(context);
      },
      child: Container(
        height: screenWidth! * 65 / 375,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 1.4),
        ),
        child: Center(
          child: Text(
            '+ Add from camera roll',
            style: TextStyle(
              fontSize: screenWidth! * 16 / 375,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
