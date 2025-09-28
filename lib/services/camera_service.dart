/*import 'package:camera/camera.dart';
import 'package:permission_handler/permission_handler.dart';

class CameraService {
  static final CameraService _instance = CameraService._internal();
  factory CameraService() => _instance;
  CameraService._internal();

  CameraController? _controller;
  List<CameraDescription>? _cameras;
  bool _isInitialized = false;

  // Getters
  CameraController? get controller => _controller;
  bool get isInitialized => _isInitialized;
  List<CameraDescription>? get cameras => _cameras;

  // Initialize camera
  Future<bool> initialize() async {
    try {
      // Request camera permission
      final status = await Permission.camera.request();
      if (!status.isGranted) {
        print('Camera permission denied');
        return false;
      }

      // Get available cameras
      _cameras = await availableCameras();
      if (_cameras == null || _cameras!.isEmpty) {
        print('No cameras found');
        return false;
      }

      // Initialize camera controller
      _controller = CameraController(
        _cameras![0], // Use first camera (usually back camera)
        ResolutionPreset.high,
        enableAudio: false,
      );

      await _controller!.initialize();
      _isInitialized = true;
      return true;
    } catch (e) {
      print('Camera initialization error: $e');
      return false;
    }
  }

  // Take a picture
  Future<XFile?> takePicture() async {
    if (!_isInitialized || _controller == null) {
      print('Camera not initialized');
      return null;
    }

    try {
      if (!_controller!.value.isInitialized) {
        print('Camera controller not initialized');
        return null;
      }

      final XFile picture = await _controller!.takePicture();
      return picture;
    } catch (e) {
      print('Error taking picture: $e');
      return null;
    }
  }

  // Switch camera (front/back)
  Future<bool> switchCamera() async {
    if (_cameras == null || _cameras!.length < 2) {
      print('Cannot switch camera - not enough cameras available');
      return false;
    }

    try {
      await dispose();
      
      // Find the next camera
      final currentCamera = _controller?.description;
      int currentIndex = _cameras!.indexOf(currentCamera!);
      int nextIndex = (currentIndex + 1) % _cameras!.length;

      // Initialize with new camera
      _controller = CameraController(
        _cameras![nextIndex],
        ResolutionPreset.high,
        enableAudio: false,
      );

      await _controller!.initialize();
      _isInitialized = true;
      return true;
    } catch (e) {
      print('Error switching camera: $e');
      return false;
    }
  }

  // Set flash mode
  Future<void> setFlashMode(FlashMode flashMode) async {
    if (!_isInitialized || _controller == null) return;

    try {
      await _controller!.setFlashMode(flashMode);
    } catch (e) {
      print('Error setting flash mode: $e');
    }
  }

  // Get current flash mode
  FlashMode getCurrentFlashMode() {
    if (!_isInitialized || _controller == null) {
      return FlashMode.auto;
    }
    return _controller!.value.flashMode;
  }

  // Set zoom level
  Future<void> setZoomLevel(double zoom) async {
    if (!_isInitialized || _controller == null) return;

    try {
      final double minZoom = await _controller!.getMinZoomLevel();
      final double maxZoom = await _controller!.getMaxZoomLevel();
      
      final double clampedZoom = zoom.clamp(minZoom, maxZoom);
      await _controller!.setZoomLevel(clampedZoom);
    } catch (e) {
      print('Error setting zoom level: $e');
    }
  }

  // Get zoom levels
  Future<Map<String, double>> getZoomLevels() async {
    if (!_isInitialized || _controller == null) {
      return {'min': 1.0, 'max': 1.0, 'current': 1.0};
    }

    try {
      final double minZoom = await _controller!.getMinZoomLevel();
      final double maxZoom = await _controller!.getMaxZoomLevel();
      final double currentZoom = await _controller!.getZoomLevel();
      
      return {
        'min': minZoom,
        'max': maxZoom,
        'current': currentZoom,
      };
    } catch (e) {
      print('Error getting zoom levels: $e');
      return {'min': 1.0, 'max': 1.0, 'current': 1.0};
    }
  }

  // Check camera permission
  Future<bool> checkCameraPermission() async {
    try {
      final status = await Permission.camera.status;
      return status.isGranted;
    } catch (e) {
      print('Error checking camera permission: $e');
      return false;
    }
  }

  // Request camera permission
  Future<bool> requestCameraPermission() async {
    try {
      final status = await Permission.camera.request();
      return status.isGranted;
    } catch (e) {
      print('Error requesting camera permission: $e');
      return false;
    }
  }

  // Dispose camera controller
  Future<void> dispose() async {
    try {
      await _controller?.dispose();
      _controller = null;
      _isInitialized = false;
    } catch (e) {
      print('Error disposing camera: $e');
    }
  }
}*/