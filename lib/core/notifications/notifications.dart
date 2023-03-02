import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:betahealth/core/notifications/utils.dart';
import 'package:betahealth/models/medicine.dart';
import 'package:betahealth/models/medicine_type.dart';

Future<void> addReminderNotification({
  required String name,
  required int dosage,
  required String type,
  required int interval,
}) async {
  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: createUniqueId(),
      channelKey: 'basic_channel',
      title: 'Reminder Set',
      body: '$name [$type] ${dosage}mg in $interval hours',
      // bigPicture: 'asset://assets/notification_map.png',
      notificationLayout: NotificationLayout.BigText,
    ),
  );
}

Future<void> scheduleReminderNotification(Medicine medicine) async {
  var hour = int.parse(medicine.startTime![0] + medicine.startTime![1]);
  var ogValue = hour;
  var minute = int.parse(medicine.startTime![2] + medicine.startTime![3]);

  for (int i = 0; i < (24 / medicine.interval!).floor(); i++) {
    if (hour + (medicine.interval! * i) > 23) {
      hour = hour + (medicine.interval! * i) - 24;
    } else {
      hour = hour + (medicine.interval! * i);
    }

    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: int.parse(medicine.notificationIDs![i]),
        channelKey: 'scheduled_channel',
        title: 'Reminder: ${medicine.medicineName}',
        body: medicine.medicineType.toString() != MedicineType.None.toString()
            ? 'It is time to take your ${medicine.medicineType!.toLowerCase()}, according to schedule'
            : 'It is time to take your medicine, according to schedule',
        notificationLayout: NotificationLayout.Default,
      ),
      actionButtons: [
        NotificationActionButton(
          key: 'MARK_DONE',
          label: 'Mark Done',
        ),
      ],
      schedule: NotificationCalendar(
        hour: hour,
        minute: minute,
        second: 0,
        millisecond: 0,
        repeats: true,
      ),
    );

    hour = ogValue;
  }
}

Future<void> cancelScheduledNotifications() async {
  await AwesomeNotifications().cancelAllSchedules();
}
