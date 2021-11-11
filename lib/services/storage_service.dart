
import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';

class StorageService {
  static final FirebaseStorage storage = FirebaseStorage.instance;

  static Future<String> getDownloadUrl(String path) async {
    if (path == '') return '';
    String downloadUrl = await storage.ref(path)
      .getDownloadURL();
    return downloadUrl;
  }

  static Future<String> uploadFile(String path, Uint8List data) async {
    var taskSnapshot =  await storage.ref(path).putData(data);
    return taskSnapshot.ref.getDownloadURL();
  }

}