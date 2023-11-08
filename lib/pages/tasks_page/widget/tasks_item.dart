import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_app/shared-components/theme/color.dart';

class TasksItems extends StatelessWidget {
  const TasksItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(
          color: Colors.amber, borderRadius: BorderRadius.circular(18)),
      child: Slidable(
        startActionPane:
            ActionPane(extentRatio: .3, motion: BehindMotion(), children: [
          SlidableAction(
            onPressed: (context) {},
            icon: Icons.delete,
            label: "Delete",
            backgroundColor: Colors.red,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              bottomLeft: Radius.circular(12),
            ),
          ),
        ]),
        endActionPane:
            ActionPane(extentRatio: .25, motion: BehindMotion(), children: [
          SlidableAction(
            onPressed: (context) {},
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
            color: Colors.white,
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
                      "Play Basket Ball",
                      style: theme.textTheme.bodyMedium,
                    ),
                    Row(
                      children: [
                        Icon(Icons.watch_later_outlined),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          "10:30",
                          style: theme.textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 4, horizontal: 22),
                decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(12.0)),
                child: const Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 40,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
