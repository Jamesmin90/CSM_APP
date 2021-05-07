import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csm/screens/components/todo.dart';
import 'package:csm/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseApi {
  // static Future<String> getName(Todo todo) async {
  //   String uid = FirebaseAuth.instance.currentUser.uid;
  //   FirebaseFirestore.instance
  //       .collection('Users')
  //       .doc(uid)
  //       .get()
  //       .then((DocumentSnapshot documentSnapshot) => {
  //             if (documentSnapshot.exists)
  //               {
  //                 todo.name = documentSnapshot.data()[uid],
  //               }
  //           });
  // }

  static Future<String> createTodo(Todo todo) async {
    String uid = FirebaseAuth.instance.currentUser!.uid;

    FirebaseFirestore.instance
        .collection('Users')
        .doc(uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) => {
              if (documentSnapshot.exists)
                {
                  todo.name = documentSnapshot.data()![uid] as String,
                }
            });

    final trips = FirebaseFirestore.instance
        .collection('trips')
        .doc('Covid Tests')
        .collection(uid)
        .doc();

    todo.id = trips.id;
    //String name;
    // todo.name = name;
    await trips.set(todo.toJson());

    return uid;
  }

  static Stream<List<Todo>> readTodos() {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    return FirebaseFirestore.instance
        .collection('trips')
        .doc('Covid Tests')
        .collection(uid)
        .snapshots()
        .transform(Utils.transformer(Todo.fromJson));
  }

  static Future updateTodo(Todo todo) async {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    final docTodo = FirebaseFirestore.instance
        .collection('trips')
        .doc('Covid Tests')
        .collection(uid)
        .doc(todo.id);

    await docTodo.update(todo.toJson());
  }

  static Future deleteTodo(Todo todo) async {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    final docTodo = FirebaseFirestore.instance
        .collection('trips')
        .doc('Covid Tests')
        .collection(uid)
        .doc(todo.id);

    await docTodo.delete();
  }
}
