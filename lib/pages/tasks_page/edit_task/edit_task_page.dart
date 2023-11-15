import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/setting_provider.dart';
import 'package:todo_app/shared-components/theme/color.dart';

import '../../../model/taskmodel.dart';

class EditTaskScreen extends StatefulWidget {
  static String routeName = "editTaskScreen";

  @override
  State<EditTaskScreen> createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  var fromKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double Hight = MediaQuery.of(context).size.height;
    double Width = MediaQuery.of(context).size.width;
    TaskModel taskModel =
        ModalRoute.of(context)?.settings.arguments as TaskModel;
    titleController.text = taskModel.title;
    descriptionController.text = taskModel.description;
    SettingProvider provider = Provider.of<SettingProvider>(context);
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            children: [
              AppBar(
                title: Text(
                  "To Do List",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                backgroundColor: primaryColor,
                flexibleSpace: SizedBox(
                  height: Hight * 0.3,
                ),
              )
            ],
          ),
          Positioned(
            top: Hight * .01,
            child: Container(
              height: Hight * .7,
              width: Width * .8,
              margin: const EdgeInsets.symmetric(vertical: 150, horizontal: 50),
              padding: const EdgeInsets.symmetric(vertical: 15),
              decoration: BoxDecoration(
                  color: Theme.of(context).accentColor,
                  borderRadius: BorderRadius.circular(15)),
              child: Form(
                key: fromKey,
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Edit Task",
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: titleController,
                        style: Theme.of(context).textTheme.bodySmall,
                        validator: (String? value) {
                          if (value == null || value.trim().isEmpty) {
                            return "you must enter the title";
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                            label: Text("Task Title",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(fontWeight: FontWeight.w600))),
                      ),
                      TextFormField(
                        controller: descriptionController,
                        style: Theme.of(context).textTheme.bodySmall,
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
                                style: Theme.of(context).textTheme.bodySmall)),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Container(
                          width: double.infinity,
                          child: Text(
                            "Select Time",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {
                          showBottomSheetDatePicker();
                        },
                        child: Text(
                          "${taskModel.dateTime?.day}-${taskModel.dateTime?.month}-${taskModel.dateTime?.year} ",
                          //  MyDatetimeUtiles.formatDate(selectedDate),
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            if (fromKey.currentState!.validate()) {
                              taskModel.title = titleController.text;
                              taskModel.description =
                                  descriptionController.text;
                              taskModel.dateTime = selectedDate;
                              provider.EditTask(taskModel);
                            }
                          },
                          child: Text(
                            "Save Change",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: Colors.white),
                          )),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
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
