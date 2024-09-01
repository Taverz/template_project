import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:servicebook_kiosk/anallytics/analytics_interface.dart';
/// Класс `AnalyticsFirebase` реализует интерфейс `AnalyticsAppUser` и предоставляет функциональность для отправки аналитических событий в Firebase Analytics.
class AnalyticsFirebase implements AnalyticsAppUser {
  static late FirebaseAnalytics analytics;
  static late FirebaseAnalyticsObserver observer;

  /// Инициализирует экземпляр Firebase Analytics и Firebase Analytics Observer.
  static init() async {
    analytics = FirebaseAnalytics.instance;
    observer = FirebaseAnalyticsObserver(analytics: analytics);
  }

  /// Создает объект `AnalyticsEventItem` для отслеживания информации о товаре.
  ///
  /// Параметры:
  /// - `amount`: сумма товара.
  /// - `valuteName`: название валюты.
  ///
  /// Возвращает созданный объект `AnalyticsEventItem`.
  static itemCreator({
    required double amount,
    required String valuteName,
  }) async {
    return AnalyticsEventItem(
      price: amount,
      currency: valuteName,
      quantity: 1,
    );
  }

  /// Отправляет событие `logSelectContent` в Firebase Analytics при нажатии на кнопку.
  static select() async {
    await analytics.logSelectContent(
      contentType: 'test content type',
      itemId: 'test item id',
    );
  }

  /// Отправляет событие `logSelectItem` в Firebase Analytics при нажатии на кнопку.
  static seelect2() async {
    await analytics.logSelectItem(
      items: [
        await itemCreator(amount: 0.0, valuteName: 'RUB'),
      ],
      itemListName: 't-shirt',
      itemListId: '1234',
    );
  }

  /// Отправляет событие `logScreenView` в Firebase Analytics при просмотре страницы.
  ///
  /// Параметры:
  /// - `namePage`: название страницы.
  static pageView({required String namePage}) async {
    await analytics.logScreenView(
      screenName: namePage,
    );
  }

  /// Начинает отслеживание просмотра страницы.
  ///
  /// Параметры:
  /// - `nemePage`: название страницы.
  static pageStart({required String nemePage}) async {}

  /// Завершает отслеживание просмотра страницы.
  ///
  /// Параметры:
  /// - `nemePage`: название страницы.
  static pageEnd({required String nemePage}) async {}

  /// Отправляет события связанные с покупкой в Firebase Analytics.
  ///
  /// Параметры:
  /// - `amount`: сумма покупки.
  /// - `valuteName`: название валюты.
  static purchase({required double amount, required String valuteName}) async {
    await analytics.logPurchase(
        currency: valuteName, transactionId: 'transaction-id');
    await analytics.logViewCart(
      currency: valuteName,
      value: amount,
      items: [
        await itemCreator(amount: amount, valuteName: valuteName),
        await itemCreator(amount: amount, valuteName: valuteName)
      ],
    );
    await analytics.logViewPromotion(
      creativeName: 'promotion name',
      creativeSlot: 'promotion slot',
      items: [await itemCreator(amount: amount, valuteName: valuteName)],
      locationId: 'United States',
      promotionId: '1234',
      promotionName: 'big sale',
    );
    await analytics.logSelectPromotion(
      creativeName: 'promotion name',
      creativeSlot: 'promotion slot',
      items: [await itemCreator(amount: amount, valuteName: valuteName)],
      locationId: 'United States',
    );
    await analytics.logGenerateLead(
      currency: valuteName,
      value: amount,
    );
    await analytics.logAddPaymentInfo();
    await analytics.logAddToCart(
      currency: valuteName,
      value: amount,
      items: [
        await itemCreator(amount: amount, valuteName: valuteName),
        await itemCreator(amount: amount, valuteName: valuteName)
      ],
    );
    await analytics.logAddToWishlist();
    await analytics.logAppOpen();
    await analytics.logBeginCheckout(
      value: amount,
      currency: valuteName,
      items: [
        await itemCreator(amount: amount, valuteName: valuteName),
        await itemCreator(amount: amount, valuteName: valuteName)
      ],
    );
  }

  /// Отправляет событие `logRefund` в Firebase Analytics при возврате товара.
  ///
  /// Параметры:
  /// - `amount`: сумма возврата.
  /// - `valuteName`: название валюты.
  static refaund({required double amount, required String valuteName}) async {
    await analytics.logRefund(
      currency: valuteName,
      value: amount,
      items: [
        await itemCreator(amount: amount, valuteName: valuteName),
        await itemCreator(amount: amount, valuteName: valuteName)
      ],
    );
  }
}
