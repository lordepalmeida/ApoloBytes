import 'package:apolobytes/models/byter.dart';
import 'package:apolobytes/models/estabelecimento.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  final String uid;
  DatabaseService({ this.uid });

  // collection reference
  final CollectionReference bytersCollection = FirebaseFirestore.instance.collection('byters');

  Future<void> updateUserData(String name) async {
    return await bytersCollection.doc(uid).set({
      'name': name,
    });
  }

  // byter list from snapshot
  List<Byter> _byterListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc){
      return Byter(name: doc.data()['name'] ?? '');
    }).toList();
  }

  // get brews stream
  Stream<List<Byter>> get byters {
    return bytersCollection.snapshots()
      .map(_byterListFromSnapshot);
  }

  // collection reference
  final CollectionReference estabelecimentosCollection = FirebaseFirestore.instance.collection('estabelecimentos');

  Future<void> updateEstabelecimentoData(String name) async {
    return await estabelecimentosCollection.doc(uid).set({
      'name': name,
    });
  }

  // byter list from snapshot
  List<Estabelecimento> _estabelecimentoListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc){
      return Estabelecimento(name: doc.data()['name'] ?? '');
    }).toList();
  }

  // get brews stream
  Stream<List<Estabelecimento>> get estabelecimentos {
    return estabelecimentosCollection.snapshots()
      .map(_estabelecimentoListFromSnapshot);
  }


}