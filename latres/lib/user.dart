import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:latres/following.dart';
import 'package:latres/userdatasource.dart';
import 'package:latres/usermodel.dart';

class ProfileUser extends StatefulWidget {
  final String username;
  const ProfileUser({Key? key, required this.username}) : super(key: key);

  @override
  _ProfileUserState createState() => _ProfileUserState();
}

class _ProfileUserState extends State<ProfileUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(13, 17, 23, 1),
      appBar: AppBar(
        title: Text("Search Result"),
        backgroundColor: Color.fromRGBO(33, 38, 45, 1),
      ),
      body: _buildDetailUserBody(),
    );
  }

  Widget _buildDetailUserBody() {
    return Container(
      child: FutureBuilder(
        future: UserDataSource.instance.loadUser(widget.username),
        builder: (
        BuildContext context,
        AsyncSnapshot<dynamic> snapshot,
      ) {
    if (snapshot.hasError) {
    return _buildErrorSection();
    }
    if (snapshot.hasData) {
    UserModel userModel = UserModel.fromJson(snapshot.data);
    return _buildSuccessSection(userModel);
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

  Widget _buildSuccessSection(UserModel data) {
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Center(
              child: Image.network(
                data.avatarUrl.toString(),
                width: MediaQuery.of(context).size.width*0.50,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Text(
              data.login.toString(),
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white70,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(0, 10, 5, 0),
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: data.following.toString()+' Following',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return Following(username: data.login.toString(),);
                            }));
                          }),
                  ]),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: data.followers.toString()+' Followers ',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            print('Login Text Clicked');
                          }),
                  ]),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: RichText(
              text: TextSpan(children: [
                TextSpan(
                    text: data.publicRepos.toString()+' Repository',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        print('Login Text Clicked');
                      }),
              ]),
            ),
          )
        ],
      ),
    );
      // Text(data.name.toString());
    //   ListView.builder(
    //   itemCount: data.toJson().length
    //   itemBuilder: (BuildContext context, int index) {
    //     return _buildItemCountries("${data.toJson()?[index].name}");
    //   },
    // );
  }

  Widget _buildItemCountries(String value) {
    return Text(value);
  }

}
