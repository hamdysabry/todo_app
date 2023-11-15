import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/model/taskmodel.dart';

class MyDataBase {
  static CollectionReference<TaskModel> getCollectionRef() {
    return FirebaseFirestore.instance
        .collection("Tasks")
        .withConverter<TaskModel>(
          fromFirestore: (snapshot, _) =>
              TaskModel.fromFirestore(snapshot.data()!),
          toFirestore: (taskModel, _) => taskModel.toFirestore(),
        );
  }

  static Future<void> addTask(TaskModel taskModel) {
    var collectionRef = getCollectionRef();
    var doc = collectionRef.doc();
    taskModel.id = doc.id;
    return doc.set(taskModel);
  }

  static Stream<QuerySnapshot<TaskModel>> getTask(DateTime dateTime) {
    var collectionRef = getCollectionRef();
    return collectionRef
        .where("datetime",
            isEqualTo: DateUtils.dateOnly(dateTime).millisecondsSinceEpoch)
        .snapshots();
  }

  static Future<void> deleteTask(String id) async {
    return await getCollectionRef().doc(id).delete();
  }

  static Future<void> updateTask(String id, TaskModel taskModel) {
    var collectionRef = getCollectionRef();
    return collectionRef.doc(id).update(taskModel.toFirestore());
  }
}
