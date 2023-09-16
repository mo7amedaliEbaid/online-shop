import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Branch extends Equatable {
  final String branchName;
  final String lat;
  final String long;
  final String imageUrl;

  const Branch({
    required this.branchName,
    required this.lat,
    required this.long,
    required this.imageUrl,
  });

  static Branch fromSnapShot(DocumentSnapshot snap) {
    Branch category = Branch(
      branchName: snap['branchName'],
      lat: snap['lat'],
      long: snap['long'],
      imageUrl: snap['imageUrl'],
    );
    return category;
  }

  @override
  List<Object?> get props => [branchName, lat,long, imageUrl];
}
