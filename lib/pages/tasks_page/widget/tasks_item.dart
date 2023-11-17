import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/model/taskmodel.dart';
import 'package:todo_app/pages/tasks_page/edit_task/edit_task_page.dart';
import 'package:todo_app/provider/setting_provider.dart';
import 'package:todo_app/shared-components/network/my_database.dart';
import 'package:todo_app/shared-components/theme/color.dart';
import 'package:todo_app/shared-components/utlies/snackbar_service.dart';

class TasksItems extends StatefulWidget {
  TaskModel taskModel;

  TasksItems(this.taskModel);

  @override
  State<TasksItems> createState() => _TasksItemsState();
}

class _TasksItemsState extends State<TasksItems> {
  @override
  Widget build(BuildContext context) {
    SettingProvider authprovider = Provider.of<SettingProvider>(context);
    var theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(
          color: Colors.amber, borderRadius: BorderRadius.circular(18)),
      child: Slidable(
        startActionPane: ActionPane(
            // extentRatio: .3,
            motion: StretchMotion(),
            children: [
              SlidableAction(
                onPressed: (context) async {
                  await MyDataBase.deleteTask(widget.taskModel.id)
                      .then((value) {
                    SnackBarService.showSuccessMessage(
                        "Task Deleted Successfully");
                  });
                },
                icon: Icons.delete,
                label: "Delete",
                backgroundColor: Colors.red,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                ),
              ),
              SlidableAction(
                onPressed: (context) {
                  Navigator.pushNamed(context, EditTaskScreen.routeName,
                      arguments: widget.taskModel);
                },
                icon: Icons.edit,
                label: "Edit",
                backgroundColor: Colors.amber,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                ),
              )
            ]),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
          decoration: BoxDecoration(
            color: Theme.of(context).accentColor,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Row(
            children: [
              Container(
                width: 5,
                height: 70,
                decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(12)),
              ),
              const SizedBox(
                width: 12,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.taskModel.title,
                      style: theme.textTheme.bodyMedium,
                      selectionColor: primaryColor,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      widget.taskModel.description,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.bodySmall,
                    ),
                    //
                    // Row(
                    //   children: [
                    //     const Icon(Icons.watch_later_outlined),
                    // const SizedBox(
                    //   width: 4,
                    // ),
                    // Text(
                    //   "10:00 AM",
                    //   style: theme.textTheme.bodySmall,
                    // ),
                    //   ],
                    // ),
                  ],
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              widget.taskModel.isDone ?? false
                  ? Text(
                      "Done!!",
                      style: theme.textTheme.headlineMedium!
                          .copyWith(color: Color(0xff61E757)),
                    )
                  : InkWell(
                      onTap: () {
                        widget.taskModel.isDone = true;
                        authprovider.EditTask(widget.taskModel);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 4, horizontal: 22),
                        decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(12.0)),
                        child: const Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
