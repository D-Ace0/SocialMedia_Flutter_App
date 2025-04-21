import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyListTile extends StatelessWidget {
  final String title;
  final String subTitle;
  final Timestamp? timestamp;
  const MyListTile({
    super.key,
    required this.title,
    required this.subTitle,
    this.timestamp,
  });

  @override
  Widget build(BuildContext context) {
    String? formattedDate;
    String? formattedTime;
    if (timestamp != null) {
      final dateTime = timestamp!.toDate();
      formattedDate = DateFormat.yMMMd().format(dateTime); // e.g., Jan 1, 2024
      formattedTime = DateFormat.Hm().format(dateTime); // e.g., 14:30
    }

    return Padding(
      padding: const EdgeInsets.only(left: 10.0, bottom: 10),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(13),
        ),
        child: ListTile(
          title: Text(
            title,
            style: TextStyle(
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
          subtitle: Text(
            subTitle,
            style: TextStyle(
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
          trailing:
              timestamp != null
                  ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        formattedDate!,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                        ),
                      ),
                      Text(
                        formattedTime!,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                        ),
                      ),
                    ],
                  )
                  : null,
        ),
      ),
    );
  }
}
