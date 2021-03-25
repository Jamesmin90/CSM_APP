import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csm/screens/components/todo.dart';
import 'package:csm/utils.dart';

class FirebaseApi {
  static Stream<List<Todo>> readTodos() => FirebaseFirestore.instance
      .collection('trips')
      .doc('Covid Test')
      .collection('uid')
      .snapshots()
      .transform(Utils.transformer(Todo.fromJson));
}
