import 'dart:io';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:betahealth/main.dart';

class NotificationController {
  /// Use this method to detect when a new notification or a schedule is created
  @pragma("vm:entry-point")
  static Future<void> onNotificationCreatedMethod(
      ReceivedNotification receivedNotification) async {
    if (receivedNotification.channelKey == 'basic_channel' ||
        receivedNotification.channelKey == 'scheduled_channel' &&
            Platform.isIOS) {
      AwesomeNotifications().getGlobalBadgeCounter().then(
            (value) => AwesomeNotifications().setGlobalBadgeCounter(0),
          );
    }
  }

  /// Use this method to detect every time that a new notification is displayed
  @pragma("vm:entry-point")
  static Future<void> onNotificationDisplayedMethod(
      ReceivedNotification receivedNotification) async {
    if (receivedNotification.channelKey == 'basic_channel' ||
        receivedNotification.channelKey == 'scheduled_channel' &&
            Platform.isIOS) {
      AwesomeNotifications().getGlobalBadgeCounter().then(
            (value) => AwesomeNotifications().setGlobalBadgeCounter(0),
          );
    }
  }

  /// Use this method to detect if the user dismissed a notification
  @pragma("vm:entry-point")
  static Future<void> onDismissActionReceivedMethod(
      ReceivedAction receivedAction) async {
    if (receivedAction.channelKey == 'basic_channel' ||
        receivedAction.channelKey == 'scheduled_channel' && Platform.isIOS) {
      AwesomeNotifications().getGlobalBadgeCounter().then(
            (value) => AwesomeNotifications().setGlobalBadgeCounter(value - 1),
          );
    }
  }

  /// Use this method to detect when the user taps on a notification or action button
  @pragma("vm:entry-point")
  static Future<void> onActionReceivedMethod(
      ReceivedAction receivedAction) async {
    if (receivedAction.channelKey == 'basic_channel' ||
        receivedAction.channelKey == 'scheduled_channel' && Platform.isIOS) {
      AwesomeNotifications().getGlobalBadgeCounter().then(
            (value) => AwesomeNotifications().setGlobalBadgeCounter(value - 1),
          );
    }

    // Navigate into pages, avoiding to open the notification details page over another details page already opened
    MyApp.navigatorKey.currentState?.pushNamedAndRemoveUntil(
        '/notification-page',
        (route) =>
            (route.settings.name != '/notification-page') || route.isFirst,
        arguments: receivedAction);
  }
}
