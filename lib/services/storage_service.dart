
import 'package:firebase_storage/firebase_storage.dart';

class StorageService {
  static final FirebaseStorage storage = FirebaseStorage.instance;

  static Future<String> getDownloadUrl(String path) async {
    if (path == '') return '';
    String downloadUrl = await storage.ref(path)
      .getDownloadURL();
    return downloadUrl;
  }

}