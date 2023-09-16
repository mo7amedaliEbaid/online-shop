import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../models/branch_model.dart';
import 'base_branch_repos.dart';


class BranchRepos extends BaseBranchRepository {
  final FirebaseFirestore _firebaseFirestore;

  BranchRepos({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Stream<List<Branch>> getAllBranches() {
    return _firebaseFirestore
        .collection('branches')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return Branch.fromSnapShot(doc);
      }).toList();
    });
  }
}
