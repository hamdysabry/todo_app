import 'package:flutter/material.dart';

class AddTaskBottomSheet extends StatefulWidget {
  const AddTaskBottomSheet({Key? key}) : super(key: key);

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  var fromKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.all(8),
      child: Form(
        key: fromKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Add New Task",
              style: theme.textTheme.bodyMedium!.copyWith(color: Colors.black),
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return "you must enter the title";
                } else {
                  return null;
                }
              },
              decoration: const InputDecoration(label: Text("Task Title")),
            ),
            TextFormField(
              autovalidateMode: AutovalidateMode.always,
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return "you must enter the Description";
                } else if (value.length < 10) {
                  return "description can't be less 10 char ";
                } else {
                  return null;
                }
              },
              maxLines: 4,
              minLines: 4,
              decoration:
                  const InputDecoration(label: Text("Task Description")),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
                width: double.infinity,
                child: Text(
                  "Select Time",
                  style:
                      theme.textTheme.bodyMedium!.copyWith(color: Colors.black),
                )),
            InkWell(
              onTap: () {
                showBottomSheetDatePicker();
              },
              child: Text(
                "17/7/2023",
                style: theme.textTheme.bodySmall,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
                onPressed: () {
                  if (fromKey.currentState!.validate()) {
                    print("text is valid");
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

  void showBottomSheetDatePicker() {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(const Duration(days: 365)));
  }
}
