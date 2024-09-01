import './analytics_firebase.dart';


import 'package:servicebook_kiosk/anallytics/analytics_amplitude.dart';
import 'package:servicebook_kiosk/anallytics/analytics_mixpanel.dart';
import 'package:servicebook_kiosk/anallytics/analytics_uxcam.dart';

/// ## Firebase
/// * invite to email

/// ## Huawei
/// * invite to email

/// ## UxCam
/// * Login: support@service-book.io
/// * Password: #Nr39Tt4k5a_CNy

/// ## Amplitude [https://analytics.amplitude.com/]
/// * Login: support@service-book.io
/// * Password: 4yF@kexMY36Ezr3
/// * Org name:  service-book.io
/// * URL:  analytics.amplitude.com/service-book
/// * Anyone with an @service-book.io email can join this org
/// * API key: 6eba60585ad0ac21eec6e0b991424088

/// ## Mixpanel
/// * support@service-book.io
/// 
/// 
/// Класс [AnalyticsAppMain] представляет основной модуль аналитики приложения.
/// Он содержит методы для инициализации аналитических инструментов и отправки событий.
class AnalyticsAppMain {
  static final AmplitudeAnalytics _amplitudeAnalytics = AmplitudeAnalytics();
  static final AnalyticsUXcamApp _analyticsUXcamApp = AnalyticsUXcamApp();
  static final AnalyticsMixpanelApp _analyticsMixpanelApp =
      AnalyticsMixpanelApp();

  /// Метод [init] инициализирует аналитические инструменты.
  /// Он вызывает методы инициализации для каждого инструмента.
  static init() async {
    await _amplitudeAnalytics.init();
    await AnalyticsFirebase.init();
    await _analyticsUXcamApp.init();
    await _analyticsMixpanelApp.init();
  }

  /// Метод [testEvent] отправляет тестовые события в аналитические инструменты.
  /// Он вызывает методы отправки событий для каждого инструмента.
  static testEvent() {
    _amplitudeAnalytics.logEvent();
    AnalyticsFirebase.pageView(namePage: "Test page");
    _analyticsUXcamApp.eventTest();
    _analyticsMixpanelApp.testEvent();
  }
}
