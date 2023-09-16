import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop/modules/branches/branches_screens/map_screen.dart';
import 'package:online_shop/widgets/navigation.dart';

import '../../../widgets/top_container.dart';
import '../branches_bloc/branch_bloc.dart';

class BranchDisplayScreen extends StatefulWidget {
  const BranchDisplayScreen({super.key});

  @override
  State<BranchDisplayScreen> createState() => _BranchDisplayScreenState();
}

class _BranchDisplayScreenState extends State<BranchDisplayScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      child: Column(
        children: [
          TopContainer(title: 'Branch', searchBarTitle: "search Branch"),
          SizedBox(
            height: 20,
          ),
          BlocBuilder<BranchBloc, BranchState>(
            builder: (context, state) {
              if (state is BranchLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is BranchLoaded) {
                return ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: state.branches.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      height: 170,
                      margin: const EdgeInsets.only(
                        bottom: 10.0,
                      ),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: CachedNetworkImageProvider(
                                  state.branches[index].imageUrl),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Stack(
                        children: [
                          Positioned(
                            left: 10,
                            bottom: 10,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  state.branches[index].branchName,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                      backgroundColor: Colors.white),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                InkWell(
                                  onTap: () {
                                    NavigateTo(
                                        context,
                                        MapScreen(
                                            latitude: double.parse(
                                                state.branches[index].lat),
                                            longitude: double.parse(state
                                                .branches[index].long)));
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Icon(
                                        Icons.map,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        "Go To Map",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            backgroundColor: Colors.white),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                );
              } else {
                return Center(
                  child: Text("Error"),
                );
              }
            },
          ),
          SizedBox(
            height: 80,
          )
        ],
      ),
    );
  }
}
