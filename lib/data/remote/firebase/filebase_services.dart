import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class FireBaseServices {
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;

  Future<String?> uploadImage(File image, String fileRefPath) async {
    Reference fileRef = await firebaseStorage.ref("Chat App/$fileRefPath");
    UploadTask task = fileRef.putFile(image);
    return task.then((p0) {
      if (p0.state == TaskState.success) {
        return fileRef.getDownloadURL();
      }
    });
  }
}
