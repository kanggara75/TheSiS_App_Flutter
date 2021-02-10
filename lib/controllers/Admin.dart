import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:thesis_app/models/User.dart';
import 'package:thesis_app/config/constants.dart';
import 'package:thesis_app/views/admin/index.dart';
import 'package:thesis_app/views/admin/update.dart';
import 'package:thesis_app/config/size_config.dart';
import 'package:thesis_app/views/admin/register.dart';
import 'package:thesis_app/views/admin/adminPanel.dart';

class AdminHomeScreen extends StatelessWidget {
  static String routeName = '/adminpage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AdminBody(),
    );
  }
}

abstract class RegisterController extends State<Register> {
  String msg = '', pmsg, emsg, umsg, pass1, pass2;
  bool _secureText = true, active = true, show = true;

  TextEditingController user = new TextEditingController();
  TextEditingController pass = new TextEditingController();
  TextEditingController email = new TextEditingController();

  showHide() {
    setState(() {
      _secureText = !_secureText;
      show = _secureText ? true : false;
      msg = '';
      print(show);
    });
  }

  cek() {
    if (pass1 == pass2) {
      if (pmsg.isNotEmpty) {
        setState(() {
          msg = pmsg + '\n';
        });
        if (emsg.isNotEmpty) {
          setState(() {
            msg = emsg + '\n';
          });
          if (umsg.isNotEmpty) {
            setState(() {
              msg = umsg + '\n';
            });
          }
        }
      } else {
        regist();
      }
    } else {
      setState(() {
        msg = kMatchPassError + '\n';
      });
    }
  }

  // ignore: missing_return
  Future<List> regist() async {
    final response = await http.post(BaseUrl.register, body: {
      "email": email.text,
      "password": pass.text,
      "name": user.text,
    });

    final data = json.decode(response.body);

    String pesan = data['messege'];
    print(data);

    if (data.length == 0) {
      setState(() {
        msg = "Unknown Error";
      });
    } else {
      setState(
        () {
          msg = pesan + '\n';
        },
      );
    }
  }

  //Config for Username section
  TextFormField usernameField() {
    return TextFormField(
      controller: user,
      keyboardType: TextInputType.name,
      onChanged: (value) {
        if (value.isNotEmpty) {
          umsg = '';
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          umsg = kUserNullError;
        }
        return null;
      },
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        hintText: "Full Name",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: IconButton(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
          ),
          iconSize: SizeConfig.screenHeight * 0.04,
          onPressed: () {},
          icon: Icon(
            Icons.person,
          ),
        ),
      ),
    );
  }

  //Config for Username section
  TextFormField emailField() {
    return TextFormField(
      controller: email,
      keyboardType: TextInputType.emailAddress,
      onChanged: (value) {
        if (value.isNotEmpty) {
          emsg = '';
        } else if (emailValidatorRegExp.hasMatch(value)) {
          emsg = '';
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          emsg = kEmailNullError;
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          emsg = kInvalidEmailError;
        }
        return null;
      },
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        hintText: "E-Mail",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: IconButton(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
          ),
          iconSize: SizeConfig.screenHeight * 0.04,
          onPressed: () {},
          icon: Icon(
            Icons.mail,
          ),
        ),
      ),
    );
  }

  //Config for passwordd section
  TextFormField password1Field() {
    return TextFormField(
      controller: pass,
      obscureText: _secureText,
      onSaved: (newValue) => pass1 = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          pmsg = '';
        } else if (value.length >= 6) {
          pmsg = '';
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          pmsg = kPassNullError;
        } else if (value.length < 6) {
          pmsg = kShortPassError;
        }
        return null;
      },
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        hintText: "Enter your password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: IconButton(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
          ),
          iconSize: SizeConfig.screenHeight * 0.04,
          onPressed: showHide,
          icon: Icon(_secureText ? Icons.visibility_off : Icons.visibility),
        ),
      ),
    );
  }

  TextFormField password2Field() {
    return TextFormField(
      onSaved: (newValue) => pass2 = newValue,
      obscureText: true,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        hintText: "Re Enter your password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
}

abstract class UserManagerController extends State<UserManager> {
  var users = new List<User>();
  bool show, admin = false;
  Timer timer;

  @override
  void initState() {
    super.initState();
    _getUsers();
    show = false;
    timer = new Timer.periodic(
      new Duration(seconds: 10),
      (t) => _getUsers(),
    );
  }

  dispose() {
    timer.cancel();
    super.dispose();
  }

  _getUsers() {
    UserGetAPI.getUsers().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        users = list.map((model) => User.fromJson(model)).toList();
        show = users.length > 0 ? true : false;
      });
    });
  }
}

abstract class UpdateUserController extends State<UpdateUser> {
  String msg = '', emsg, umsg;
  bool roleS = false, statusS = false;
  bool isLoading = false, fail = false;

  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController role = TextEditingController();
  final TextEditingController status = TextEditingController();
  final TextEditingController id = TextEditingController();
  final TextEditingController uid = TextEditingController();

  @override
  void initState() {
    if (widget.id != null) {
      id.text = widget.id.toString();
      name.text = widget.name;
      email.text = widget.email;
      uid.text = "AdminTheSiS";

      //Cek Kondisi
      roleS = widget.role == 1 ? true : false;
      statusS = widget.status == 1 ? true : false;
    }
    super.initState();
  }

  cek() {
    status.text = statusS ? "1" : "0";
    role.text = roleS ? "1" : "2";

    if (umsg != null) {
      setState(() {
        fail = true;
        msg = umsg + '\n';
      });
    } else if (emsg != null) {
      setState(() {
        fail = true;
        msg = emsg + '\n';
      });
    } else if (emsg == null && umsg == null) {
      setState(() {
        update();
      });
    }
  }

  // ignore: missing_return
  Future<List> update() async {
    final response = await http.post(BaseUrl.user, body: {
      "id": id.text,
      "uid": uid.text,
      "role": role.text,
      "name": name.text,
      "email": email.text,
      "status": status.text,
    });
    final data = json.decode(response.body);
    var pesan = data['msg'];
    if (data.length == 0) {
      setState(() {
        msg = "Unknown Error";
      });
    } else {
      setState(() {
        fail = false;
        msg = '$pesan\n';
      });
      Future.delayed(const Duration(milliseconds: 1500), () {
        setState(() {
          msg = '';
        });
      });
    }
  }

  //Config for Username section
  TextFormField nameField() {
    return TextFormField(
      controller: name,
      keyboardType: TextInputType.name,
      onChanged: (value) {
        if (value.isNotEmpty) {
          umsg = null;
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          umsg = kUserUpdateNullError;
        }
        return null;
      },
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        hintText: "Full Name",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: IconButton(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
          ),
          iconSize: SizeConfig.screenHeight * 0.04,
          onPressed: () {},
          icon: Icon(
            Icons.person,
          ),
        ),
      ),
    );
  }

  TextFormField emailField() {
    return TextFormField(
      controller: email,
      keyboardType: TextInputType.emailAddress,
      onChanged: (value) {
        if (value.isNotEmpty) {
          emsg = null;
        } else if (emailValidatorRegExp.hasMatch(value)) {
          emsg = null;
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          emsg = kEmailNullError;
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          emsg = kInvalidEmailError;
        }
        return null;
      },
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        hintText: "E-Mail",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: IconButton(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
          ),
          iconSize: SizeConfig.screenHeight * 0.04,
          onPressed: () {},
          icon: Icon(
            Icons.mail,
          ),
        ),
      ),
    );
  }
}
