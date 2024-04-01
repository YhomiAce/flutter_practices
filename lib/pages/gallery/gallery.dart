import 'package:boxed_app/widgets/side_bar.dart';
import 'package:flutter/material.dart';
import 'package:gallery_picker/gallery_picker.dart';

class Gallery extends StatefulWidget {
  const Gallery({super.key});

  @override
  State<Gallery> createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  List<MediaFile> _selectedFiles = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Gallery Picker"),
      ),
      drawer: const SideBarDrawer(),
      body: _buildUI(),
      floatingActionButton: _selectImageFromGalleryButton(context),
    );
  }

  Widget _selectImageFromGalleryButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        List<MediaFile>? mediaFiles =
            await GalleryPicker.pickMedia(context: context) ?? [];
        print(mediaFiles); // keep printing [];
        setState(() {
          _selectedFiles = mediaFiles;
        });
      },
      child: const Icon(Icons.image),
    );
  }

  Widget _buildUI() {
    return GridView.builder(
      scrollDirection: Axis.vertical,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.75,
      ),
      itemCount: _selectedFiles.length,
      itemBuilder: (context, index) {
        MediaFile file = _selectedFiles[index];
        if (file.isImage) {
          return Expanded(
            child: PhotoProvider(media: file),
          );
        } else if (file.isVideo) {
          return Expanded(child: VideoProvider(media: file));
        }
      },
    );
  }
}
