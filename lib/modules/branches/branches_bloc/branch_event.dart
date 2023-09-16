part of 'branch_bloc.dart';

abstract class BranchEvent extends Equatable {
  const BranchEvent();

  @override
  List<Object> get props => [];
}

class LoadBranches extends BranchEvent {}

class UpdateBranches extends BranchEvent {
  final List<Branch> branches;

  UpdateBranches(this.branches);

  @override
  List<Object> get props => [branches];
}
