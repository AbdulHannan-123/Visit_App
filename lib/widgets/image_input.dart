import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspaths;

class ImageInput extends StatefulWidget {
  final Function onSelect;

  ImageInput(this.onSelect);

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? _storedImage;

  Future<void> _takePicture()async{
    // final picker = ImagePicker();
   final imageFile =await ImagePicker().getImage(source: ImageSource.camera, maxHeight: 600,);
   setState(() {
     _storedImage = File(imageFile!.path);
   });
   final appDir = await syspaths.getApplicationDocumentsDirectory();
   final fileName = path.basename(imageFile!.path);
   final savedImage = await File(imageFile.path).copy('${appDir.path}/$fileName');
   widget.onSelect(savedImage);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            border: Border.all(
                width: 1, color: Theme.of(context).colorScheme.secondary),
          ),
          alignment: Alignment.center,
          child: _storedImage != null
              ? Image.file(
                  _storedImage!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                )
              : const Text('No Image Taken',textAlign: TextAlign.center,),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: TextButton.icon(
            icon:const Icon(Icons.camera),
            onPressed: _takePicture,
            label:const Text('Take Picture'),
            style: TextButton.styleFrom(primary: Theme.of(context).colorScheme.primary),
          ),
        )
      ],
    );
  }
}
