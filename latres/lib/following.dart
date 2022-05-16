import 'package:flutter/material.dart';
import 'package:latres/followersmodel.dart';
import 'package:latres/followingdatasource.dart';
import 'package:latres/followingmodel.dart';

class Following extends StatefulWidget {
  final String username;
  const Following({Key? key, required this.username}) : super(key: key);

  @override
  _FollowingState createState() => _FollowingState();
}

class _FollowingState extends State<Following> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(13, 17, 23, 1),
      appBar: AppBar(
        title: Text("Following List"),
        backgroundColor: Color.fromRGBO(33, 38, 45, 1),
      ),
      body: _buildDetailCountriesBody(),
    );
  }
  Widget _buildDetailCountriesBody() {
    return Container(
      child: FutureBuilder(
        future: FollowingDataSource.instance.loadFollowing(widget.username),
        builder: (
            BuildContext context,
            AsyncSnapshot<dynamic> snapshot,
            ) {
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
              // _buildErrorSection();
          }
          if (snapshot.hasData) {
            FollowingModel followingModel =
            FollowingModel.fromJson(snapshot.data);
            return _buildSuccessSection(followingModel);
          }
          return _buildLoadingSection();
        },
      ),
    );
  }

  Widget _buildErrorSection() {
    return Text("Error");
  }
  Widget _buildEmptySection() {
    return Text("Empty");
  }
  Widget _buildLoadingSection() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
  Widget _buildSuccessSection(FollowingModel data) {
    return
      // Text("coba");
      ListView.builder(
      itemCount: data.toJson().length,
      itemBuilder: (BuildContext context, int index) {
        return _buildItemCountries("${data.login}");
      },
    );
  }
  Widget _buildItemCountries(String value) {
    return Text(value);
  }

}
