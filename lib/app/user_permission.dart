import 'package:permission_handler/permission_handler.dart';

class UserPermission {
  static Future<void> checkCameraPermission() async {
    final cameraStatus = await Permission.camera.status;
    if (cameraStatus.isDenied ||
        cameraStatus.isRestricted ||
        cameraStatus.isLimited) {
      await Permission.camera.request();
    }
  }
}
