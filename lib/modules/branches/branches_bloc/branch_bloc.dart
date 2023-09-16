import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../models/branch_model.dart';
import '../branches_repos/branch_repos.dart';


part 'branch_event.dart';
part 'branch_state.dart';

class BranchBloc extends Bloc<BranchEvent, BranchState> {
  final BranchRepos _branchRepos;
  StreamSubscription? _branchSubscription;
  BranchBloc({required BranchRepos branchRepos})
      : _branchRepos = branchRepos,
        super(BranchLoaded()) {
    on<LoadBranches>(_mapLoadBranchesToState);
    on<UpdateBranches>(_mapUpdateBranchesToState);
  }

  FutureOr<void> _mapUpdateBranchesToState(
      UpdateBranches event, Emitter<BranchState> emit) async {
    emit(BranchLoaded(branches: event.branches));
  }

  FutureOr<void> _mapLoadBranchesToState(
      LoadBranches event, Emitter<BranchState> emit) async {
    _branchSubscription?.cancel();
    _branchSubscription = _branchRepos.getAllBranches().listen(
      (branches) {
        add(
          UpdateBranches(branches),
        );
      },
    );
  }
}
