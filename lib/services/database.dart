import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myfiebase/models/ult.dart';
import 'package:myfiebase/models/user.dart';

class DataBaseService {
  // Collection Reference
  final String? uid;
  final CollectionReference ultCollection =
      FirebaseFirestore.instance.collection('ult-fire');

  // Constructor
  DataBaseService({this.uid});

  Future updateUserData(String sugars, String name, int strength) async {
    print(uid);
    return await ultCollection.doc(uid).set({
      'sugars': sugars,
      'name': name,
      'strength': strength,
    });
  }

  // ult list
  List<Ult> _ultListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Ult(
        name: doc.get('name') ?? '',
        sugars: doc.get('sugars') ?? '',
        strength: doc.get('strength') ?? 0,
      );
    }).toList();
  }

  Stream<List<Ult>> get ults {
    return ultCollection.snapshots().map(_ultListFromSnapshot);
  }

  // User Data From Snapshot
  UserData _userDataFromSnapShot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      name: snapshot.get('name'),
      sugars: snapshot.get('sugars'),
      strength: snapshot.get('strength'),
    );
  }

  // Get User Doc Stream
  Stream<UserData> get userData {
    return ultCollection.doc(uid).snapshots().map(_userDataFromSnapShot);
  }
}
