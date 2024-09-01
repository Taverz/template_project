interface class AnalyticsAppUser {
  static init() async {}

  static itemCreator() async {}

  /// BUTTOM TAP
  static select() async {}

  /// BUTTOM TAP
  static seelect2() async {}

  /// START PAGE
  static pageView({required String nemePage}) async {}

  static pageStart({required String nemePage}) async {}
  static pageEnd({required String nemePage}) async {}

  /// PAY
  static purchase({required double amount, required String valuteName}) async {}

  static refaund({required double amount, required String valuteName}) async {}
}
