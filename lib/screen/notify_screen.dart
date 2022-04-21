import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:groshop/db/notifications_api.dart';
import 'package:groshop/utils/constants.dart';
import 'package:groshop/widgets/dialog.dart';
import 'package:groshop/widgets/progress_dialog.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../models/app_notifications.dart';
import '../widgets/badge.dart';
import '../widgets/no_data.dart';
import '../widgets/processing.dart';

class NotifyScreen extends StatelessWidget {
  final _notificationsApi = NotificationsApi();
  final _appNotifications = AppNotifications();

  @override
  Widget build(BuildContext context) {
    final progressDialog = ProgressDialog(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Thông Báo"),
        actions: [
          IconButton(
              icon: Icon(Icons.delete_forever_outlined),
              onPressed: () async {
                /// Delete all Notifications
                ///
                /// Show confirm dialog
                confirmDialog(context,
                    message:
                        "Tất cả thông báo sẽ được xóa. Điều này không thể khôi phục!",
                    negativeAction: () => Navigator.of(context).pop(),
                    positiveText: "XÓA",
                    positiveAction: () async {
                      // Show processing dialog
                      progressDialog.show("Đang xóa...");

                      /// Delete
                      await _notificationsApi.deleteUserNotifications();

                      // Hide progress dialog
                      progressDialog.hide();
                      // Hide confirm dialog
                      Navigator.of(context).pop();
                    });
              })
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: _notificationsApi.getNotifications(),
          builder: (context, snapshot) {
            /// Check data
            if (!snapshot.hasData) {
              return Processing(text: "Đang tải...");
            } else if (snapshot.data!.docs.isEmpty) {
              /// No notification
              return NoData(text: "Không có thông báo");
            } else {
              return ListView.separated(
                shrinkWrap: true,
                separatorBuilder: (context, index) => Divider(height: 10),
                itemCount: snapshot.data!.docs.length,
                itemBuilder: ((context, index) {
                  /// Get notification DocumentSnapshot
                  final DocumentSnapshot notification =
                      snapshot.data!.docs[index];
                  final String? nType = notification[Constants.N_TYPE];
                  // Handle notification icon
                  late ImageProvider bgImage;
                  if (nType == 'alert') {
                    bgImage = AssetImage('assets/images/app_logo.png');
                  } else {
                    bgImage = NetworkImage(
                        notification[Constants.N_SENDER_PHOTO_LINK]);
                  }

                  /// Show notification
                  return Container(
                    color: !notification[Constants.N_READ]
                        ? Theme.of(context).primaryColor.withAlpha(40)
                        : null,
                    child: ListTile(
                      leading: CircleAvatar(
                          backgroundColor: Theme.of(context).primaryColor,
                          backgroundImage: bgImage),
                      title: Text(
                          notification[Constants.N_TYPE] == 'alert'
                              ? notification[Constants.N_SENDER_FULLNAME]
                              : notification[Constants.N_SENDER_FULLNAME]
                                  .split(" ")[0],
                          style: TextStyle(fontSize: 18)),
                      subtitle: Text("${notification[Constants.N_MESSAGE]}\n"
                          "${timeago.format(notification[Constants.TIMESTAMP].toDate())}"),
                      trailing: !notification[Constants.N_READ]
                          ? Badge(text: "Mới")
                          : null,
                      onTap: () async {
                        /// Set notification read = true
                        await notification.reference
                            .update({Constants.N_READ: true});

                        /// Handle notification click
                        _appNotifications.onNotificationClick(context,
                            nType: (notification.data() as Map<String, dynamic>)[
                                    Constants.N_TYPE] ??
                                '',
                            nSenderId: (notification.data() as Map<String,
                                    dynamic>)[Constants.N_SENDER_ID] ??
                                '',
                            nMessage: (notification.data() as Map<String,
                                    dynamic>)[Constants.N_MESSAGE] ??
                                '');
                      },
                    ),
                  );
                }),
              );
            }
          }),
    );
  }
}
