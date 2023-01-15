import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerProvider with ChangeNotifier {
  XFile? _courseImage;

  XFile? get selectedImage => _courseImage;

  set selectedImage(XFile? value) {
    _courseImage = value;
    notifyListeners();
  }

  // chooseImageFromGC() async {
  //   ImagePicker _picker = ImagePicker();
  //   _courseImage = await _picker.pickImage(
  //     source: ImageSource.camera,
  //     imageQuality: 10,
  //   );
  //   notifyListeners();
  // }
}
