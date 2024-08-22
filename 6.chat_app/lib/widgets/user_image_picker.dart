import 'dart:io';

import 'package:chat_app/widgets/avatar.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserImagePicker extends StatefulWidget {
  const UserImagePicker({super.key, required this.onPickImage, required this.onPickAvatar});
  final void Function(File pickedImage) onPickImage;
  final void Function(String avatar) onPickAvatar;
  @override
  State<StatefulWidget> createState() {
    return _UserImagePickerState();
  }
}

class _UserImagePickerState extends State<UserImagePicker> {
  File? _pickedImageFile;
  String? _pickedAvatar;
  void _pickImage() async {
    final pickedImage = await ImagePicker().pickImage(
      source: ImageSource.camera,
      imageQuality: 50,
      maxWidth: 150,
    );
    if (pickedImage == null) {
      return;
    }
    setState(() {
      _pickedImageFile = File(pickedImage.path);
    });

    widget.onPickImage(_pickedImageFile!);
  }

  void _onSelectedImgUrl(url) {
    setState(() {
    
      _pickedAvatar = url;
    });
    widget.onPickAvatar(_pickedAvatar!);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: Colors.grey,
          backgroundImage: _pickedAvatar != null ? AssetImage(_pickedAvatar!) : null,
          // foregroundImage:
          //     _pickedImageFile != null ? FileImage(_pickedImageFile!) : null,
        ),
        const SizedBox(height: 10,),
        ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return Avatar(onSelectedImgUrl: _onSelectedImgUrl,);
              },
            );
          },
          child: Text('Open Modal Avatar'),
        ),
        // TextButton.icon(
        //   onPressed: _pickImage,
        //   label: Text(
        //     'Add Image',
        //     style: TextStyle(color: Theme.of(context).colorScheme.primary),
        //   ),
        //   icon: Icon(Icons.image),
        // )
      ],
    );
  }
}
