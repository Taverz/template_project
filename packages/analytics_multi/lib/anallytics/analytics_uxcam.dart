import 'package:flutter_uxcam/flutter_uxcam.dart';
import 'package:servicebook_kiosk/anallytics/analytics_interface.dart';

class AnalyticsUXcamApp implements AnalyticsAppUser {

  final String _UXCAM_APP_KEY = "yro0l8imy9d826y";
  final String nameApp  = 'Kiosk Settlement';
  
  late final FlutterUxConfig _config;

  Future<void> init() async{
    FlutterUxcam.optIntoSchematicRecordings(); // Confirm that you have user permission for screen recording
    _config = FlutterUxConfig(userAppKey: _UXCAM_APP_KEY);
    FlutterUxcam.startWithConfiguration(_config);
  }
  
  void eventTest() async {
    await FlutterUxcam.logEvent("Test event");
  }
}