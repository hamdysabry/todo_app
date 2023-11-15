import 'package:flutter/material.dart';
import 'package:todo_app/pages/setting_page/setting.dart';
import 'package:todo_app/pages/tasks_page/tasks.dart';

import '../pages/tasks_page/widget/add_task_bottom_sheet.dart';

class HomeLayout extends StatefulWidget {
  static const String routeName = "Home-layout";

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int currentSelectedIndex = 0;
  List<Widget> Screens = [TasksPage(), SettingPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "To Do List",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: Screens[currentSelectedIndex],
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAddTaskBottomSheet();
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        shape: StadiumBorder(
            side: BorderSide(
          color: Theme.of(context).accentColor,
          width: 4,
        )),
      ),
      bottomNavigationBar: BottomAppBar(
        notchMargin: 8,
        shape: CircularNotchedRectangle(),
        child: BottomNavigationBar(
          onTap: (int index) {
            setState(() {
              currentSelectedIndex = index;
            });
          },
          currentIndex: currentSelectedIndex,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.list), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: ""),
          ],
        ),
      ),
    );
  }

  void showAddTaskBottomSheet() {
    showModalBottomSheet(
      backgroundColor: Theme.of(context).accentColor,
      context: context,
      isScrollControlled: true,
      builder: (context) => Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: AddTaskBottomSheet()),
    );
  }
}
