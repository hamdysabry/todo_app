import 'package:flutter/material.dart';
import 'package:todo_app/model/taskmodel.dart';
import 'package:todo_app/shared-components/network/my_database.dart';
import 'package:todo_app/shared-components/utlies/my-datetime_utlies.dart';

class AddTaskBottomSheet extends StatefulWidget {
  const AddTaskBottomSheet({Key? key}) : super(key: key);

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  var fromKey = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.all(12),
      child: Form(
        key: fromKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Add New Task",
                style: theme.textTheme.bodySmall!
                    .copyWith(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: titleController,
              style: theme.textTheme.bodySmall,
              validator: (String? value) {
                if (value == null || value.trim().isEmpty) {
                  return "you must enter the title";
                } else {
                  return null;
                }
              },
              decoration: InputDecoration(
                  label: Text("Task Title", style: theme.textTheme.bodySmall)),
            ),
            TextFormField(
              controller: descriptionController,
              style: theme.textTheme.bodySmall,
              autovalidateMode: AutovalidateMode.always,
              validator: (String? value) {
                if (value == null || value.trim().isEmpty) {
                  return "you must enter the Description";
                } else if (value.length < 10) {
                  return "description can't be less 10 char ";
                } else {
                  return null;
                }
              },
              maxLines: 4,
              minLines: 4,
              decoration: InputDecoration(
                  label: Text("Task Description",
                      style: theme.textTheme.bodySmall)),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
                width: double.infinity,
                child: Text(
                  "Select Time",
                  style: theme.textTheme.bodySmall!
                      .copyWith(fontSize: 18, fontWeight: FontWeight.bold),
                )),
            InkWell(
              onTap: () {
                showBottomSheetDatePicker();
              },
              child: Text(
                MyDatetimeUtiles.formatDate(selectedDate),
                // selectedDate.toString(),
                style: theme.textTheme.bodySmall,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
                onPressed: () {
                  if (fromKey.currentState!.validate()) {
                    TaskModel taskModel = TaskModel(
                        title: titleController.text,
                        description: descriptionController.text,
                        dateTime: selectedDate);
                    MyDataBase.addTask(taskModel).then((value) {
                      Navigator.pop(context);
                    });
                  }
                },
                child: Text(
                  "Submit",
                  style:
                      theme.textTheme.bodyMedium!.copyWith(color: Colors.white),
                )),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }

  DateTime selectedDate = DateUtils.dateOnly(DateTime.now());

  void showBottomSheetDatePicker() async {
    DateTime? choseenDate = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(const Duration(days: 365)));
    if (choseenDate == null) return;
    setState(() {
      selectedDate = DateUtils.dateOnly(choseenDate);
    });
  }
}
