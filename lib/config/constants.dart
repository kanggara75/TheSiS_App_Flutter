import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:thesis_app/config/size_config.dart';

const kTextColor = Color(0xFFFFFFFF);
const kPrimaryColor = Color(0xFF06b3fa);
const kSecondaryColor = Color(0xFF979797);
const kPrimaryLightColor = Color(0xFFFFECDF);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
);

const kAnimationDuration = Duration(milliseconds: 200);

final headingStyle = TextStyle(
  height: 1.5,
  color: Colors.black,
  fontWeight: FontWeight.bold,
  fontSize: getProportionateScreenWidth(28),
);

const defaultDuration = Duration(milliseconds: 250);

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kUserNullError = "Please Enter your Name";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kNamelNullError = "Please Enter your name";
const String kEmailNullError = "Please Enter your email";
const String kPassNullError = "Please Enter your password";
const String kUserUpdateNullError = "Please Enter User Name";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kAddressNullError = "Please Enter your address";
const String kPhoneNumberNullError = "Please Enter your phone number";

final otpInputDecoration = InputDecoration(
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
  contentPadding:
      EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderSide: BorderSide(color: kTextColor),
    borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
  );
}

class BaseUrl {
  // static String baseUrl = "http://200.0.0.2/thesis/";
  static String baseUrl = "https://thesis.kanggara.net/";
  // static String baseUrl = "http://192.168.43.15/thesis/";
  static String acc = baseUrl + "api/acc";
  static String user = baseUrl + "api/user";
  static String login = baseUrl + "api/login";
  static String kontrol = baseUrl + "api/kontrol";
  static String maplist = baseUrl + "api/maplist";
  static String register = baseUrl + "api/register";
  static String profileImage = baseUrl + "assets/img/profile/";
}

class UserGetAPI {
  static Future getUsers() {
    return http.get(BaseUrl.user);
  }
}
