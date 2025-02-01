import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';

//permission
Future<bool> checkStoragePermission() async {
  bool isGranted = await Permission.manageExternalStorage.isGranted;
  return isGranted;
}

Future<void> requestStoragePermission() async {
  await Permission.manageExternalStorage.request();
}

//full screen
void toggleAndroidFullScreen(bool isFullScreen) {
  if (isFullScreen) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive,
    //     overlays: [SystemUiOverlay.top]);
  } else {
    // Exit Full-Screen Mode
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
  }
}
