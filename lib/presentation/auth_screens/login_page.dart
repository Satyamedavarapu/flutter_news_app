import 'package:flutter/material.dart';
import 'package:flutter_news_app/presentation/auth_screens/forgot_password_page.dart';
import 'package:flutter_news_app/presentation/auth_screens/register_page.dart';
import 'package:flutter_news_app/presentation/screens/home_screen.dart';
import 'package:flutter_news_app/utilities/util_widgets.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  UtilWidgets utilWidgets = UtilWidgets();

  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isVisible = true;

  final GlobalKey<FormState> _form = GlobalKey<FormState>();

  bool validateForm() {
    if (_form.currentState!.validate() == true) {
      _form.currentState!.save();
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _form,
      child: Material(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(top: 4.0),
                  child: SvgPicture.asset('assets/login.svg'),
                ),
              ),
              Expanded(
                flex: 6,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 12.0,
                    color: Colors.grey[100],
                    margin: const EdgeInsets.all(12.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          utilWidgets.userNameField(
                              userController: userController,
                              fieldName: 'UserName'),
                          utilWidgets.passwordField(isVisible, () {
                            setState(() {
                              isVisible = !isVisible;
                            });
                          }, passwordController),
                          Align(
                              alignment: Alignment.topRight,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        PageTransition(
                                            child: const ForgotPassword(),
                                            type: PageTransitionType
                                                .rightToLeftJoined));
                                  },
                                  child: Text(
                                    'Forgot Password',
                                    style: style,
                                  ),
                                ),
                              )),
                          utilWidgets.cupButton(
                              context: context,
                              buttonName: 'Login',
                              onTap: () {
                                if (validateForm() == true) {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          child: const LoginPage(),
                                          type: PageTransitionType
                                              .leftToRightJoined));
                                }
                              }),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      child: const RegisterPage(),
                                      type: PageTransitionType
                                          .bottomToTopJoined));
                            },
                            child: RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                    text: 'I\'m a new user ', style: style),
                                const TextSpan(
                                    text: 'Register',
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold))
                              ]),
                            ),
                          )
                        ]),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(),
              ),
            ],
          )),
    );
  }

  TextStyle style = const TextStyle(
      color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.bold);
}
