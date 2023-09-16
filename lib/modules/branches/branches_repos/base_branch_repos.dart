
import '../../../models/branch_model.dart';

abstract class BaseBranchRepository {
  Stream<List<Branch>> getAllBranches();
}
