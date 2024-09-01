import 'package:flutter/foundation.dart';
import 'package:mixpanel_flutter/mixpanel_flutter.dart';
import 'package:servicebook_kiosk/anallytics/analytics_interface.dart';

/// Класс [AnalyticsMixpanelApp] реализует интерфейс [AnalyticsAppUser] и представляет собой
/// приложение для аналитики, использующее Mixpanel.
class AnalyticsMixpanelApp implements AnalyticsAppUser {
  final String _projectToken = "4742f93e06b3ab9c4a2fc58f73a6d417";
  late final Mixpanel _mixpan;

  /// Метод [init] инициализирует приложение Mixpanel.
  ///
  /// Внутри метода происходит инициализация Mixpanel с использованием [_projectToken].
  /// Также устанавливается режим логирования в зависимости от значения [kDebugMode].
  Future<void> init() async {
    _mixpan = await Mixpanel.init(_projectToken, trackAutomaticEvents: true);
    _mixpan.setLoggingEnabled(kDebugMode);
  }

  /// Метод [registerNameObjectOrganization] регистрирует имя, объект и организацию.
  ///
  /// В данный момент метод не выполняет никаких действий, так как комментированная строка
  /// `mixpanel.identify("CityCreekRostov");` не активирована.
  void registerNameObjectOrganization() {
    // mixpanel.identify("CityCreekRostov");
  }

  /// Метод [testEvent] отправляет тестовое событие в Mixpanel.
  ///
  /// Внутри метода вызывается метод [_mixpan.eventElapsedTime], который отправляет
  /// событие с именем "TEST event" в Mixpanel.
  void testEvent() async {
    await _mixpan.eventElapsedTime("TEST event");
  }
}
