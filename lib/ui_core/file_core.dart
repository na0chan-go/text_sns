import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';

class FileCore {
  static Future<CroppedFile?> getImage() async {
    final xFile = await _pickImage();
    final croppedFile = await _cropImage(xFile);
    return croppedFile;
  }

  static Future<XFile?> _pickImage() async {
    final picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.gallery);
    return image;
  }

  static Future<CroppedFile?> _cropImage(XFile? xFile) async {
    if (xFile == null) {
      return null;
    } else {
      final instance = ImageCropper();
      final result = await instance.cropImage(
          sourcePath: xFile.path,
          aspectRatioPresets: [CropAspectRatioPreset.square]);
      return result;
    }
  }
}