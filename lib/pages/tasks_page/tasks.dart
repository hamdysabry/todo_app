import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/model/taskmodel.dart';
import 'package:todo_app/pages/tasks_page/widget/tasks_item.dart';
import 'package:todo_app/shared-components/network/my_database.dart';
import 'package:todo_app/shared-components/theme/color.dart';

import '../../provider/setting_provider.dart';

class TasksPage extends StatefulWidget {
  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  DateTime selectedDate = DateUtils.dateOnly(DateTime.now());

  // DateUtils.dateOnly(DateTime.now());

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingProvider>(context);

    return Column(
      children: [
        CalendarTimeline(
          initialDate: provider.selectedDate,
          firstDate: DateTime.now().subtract(Duration(days: 365)),
          lastDate: DateTime.now().add(Duration(days: 365)),
          activeBackgroundDayColor: Colors.white,
          onDateSelected: (date) {
            provider.setNewSelectedDate(date);
          },
          leftMargin: 20,
          monthColor: primaryColor,
          dayColor: primaryColor,
          activeDayColor: primaryColor,
          dotsColor: primaryColor,
          // selectableDayPredicate: (date) => date.day != 23,
          //locale: 'en_ISO',
        ),
        StreamBuilder(
          stream: MyDataBase.getTask(provider.selectedDate),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                  child: Text(
                "Something went wrong!",
                style: Theme.of(context).textTheme.headlineMedium,
              ));
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            List<TaskModel> tasksList =
                snapshot.data?.docs.map((e) => e.data()).toList() ?? [];
            return tasksList.isNotEmpty
                ? Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) =>
                          TasksItems(tasksList[index]),
                      itemCount: tasksList.length,
                    ),
                  )
                : Center(
                    child: Text("No Tasks Found...",
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontSize: 22, fontWeight: FontWeight.bold)),
                  );
          },
        ),
      ],
    );
  }
}
