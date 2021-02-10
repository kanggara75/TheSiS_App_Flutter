import 'package:flutter/material.dart';
import 'package:thesis_app/config/constants.dart';
import 'package:thesis_app/controllers/Admin.dart';
import 'package:thesis_app/views/admin/update.dart';
import 'package:thesis_app/config/size_config.dart';
import 'package:thesis_app/views/admin/register.dart';

class UserRegister extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(25)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.05),
                Image.asset(
                  "assets/icons/logo.png",
                  height: SizeConfig.screenHeight * 0.1,
                  fit: BoxFit.contain,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.02),
                Text(
                  "User Registration",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: getProportionateScreenWidth(28),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.03),
                Register(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class UserManager extends StatefulWidget {
  @override
  _UserManagerState createState() => _UserManagerState();
}

class _UserManagerState extends UserManagerController {
  @override
  build(context) {
    return show
        ? Container(
            color: Colors.black.withOpacity(0.25),
            child: Container(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              margin: EdgeInsets.fromLTRB(15, 15, 15, 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.lightBlueAccent,
              ),
              child: ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, i) {
                  admin = users[i].role == 1 ? true : false;
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => UpdateUser(
                            id: users[i].id,
                            name: users[i].name,
                            role: users[i].role,
                            status: users[i].status,
                            email: users[i].email,
                          ),
                        ),
                      );
                    },
                    child: Card(
                      elevation: 8,
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.white70,
                          foregroundColor: Colors.black,
                          backgroundImage: NetworkImage(
                              BaseUrl.profileImage + users[i].image),
                        ),
                        // isThreeLine: true,
                        title: Text(
                          users[i].name,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text('E-Mail: ${users[i].email}'),
                        trailing: admin
                            ? Icon(
                                Icons.verified_user,
                                color: Colors.blueAccent,
                              )
                            : Icon(
                                Icons.person,
                                color: Colors.blueGrey,
                              ),
                        //if (users[i].role == 1) {Text("Admin")}else{Text("Member")},
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        : Center(
            child: Container(
              width: getProportionateScreenWidth(250),
              height: getProportionateScreenHeight(250),
              child: CircularProgressIndicator(),
            ),
          );
  }
}

class Setting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Setting"),
    );
  }
}
