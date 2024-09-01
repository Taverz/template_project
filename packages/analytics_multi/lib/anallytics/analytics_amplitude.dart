import 'package:amplitude_flutter/amplitude.dart';
import 'package:servicebook_kiosk/anallytics/analytics_interface.dart';
/// Класс для реализации аналитики с помощью Amplitude.
class AmplitudeAnalytics implements AnalyticsAppUser {
  /// Ключ API - 6eba60585ad0ac21eec6e0b991424088.
  static late Amplitude _analytics;
  /// Локация по умолчанию - RU.
  final String _zoneLocation = "RU";
  /// Название проекта - Kiosk Settlement.
  final String _projectName = "Kiosk Settlement"; 
  /// Ключ API для доступа к сервису Amplitude.
  final String _keyAPI = "6eba60585ad0ac21eec6e0b991424088";
  /// URL сервиса Amplitude.
  final String _urlServMe = "analytics.amplitude.com/service-book"; // "analytics.amplitude.com/service-book" // default = "api2.amplitude.com"

  /// Инициализация аналитики.
  Future<void> init() async{
    _analytics = Amplitude.getInstance(instanceName: _projectName);
    await _analytics.setUseDynamicConfig(true);
    await _analytics.setServerUrl("https://$_urlServMe");

    await _analytics.init(_keyAPI);
    await _analytics.enableCoppaControl();

    await _analytics.trackingSessionEvents(true);
    await _analytics.setMinTimeBetweenSessionsMillis(5000);
    await _analytics.setEventUploadThreshold(5);
    await _analytics.setEventUploadPeriodMillis(30000);
    await _analytics.setServerZone(_zoneLocation);
  }

  /// Запись событий аналитики.
  void logEvent() {
    _analytics.logEvent('Sign Up');
    _analytics.logEvent(
      'MyApp startup',
      eventProperties: {'event_prop_1': 10, 'event_prop_2': true},
    );
    _analytics.logEvent('Out of Session Event', outOfSession: true);
    _analytics.setOptOut(true);
    _analytics.logEvent('Opt Out Event');
    _analytics.setOptOut(false);
  }
}
