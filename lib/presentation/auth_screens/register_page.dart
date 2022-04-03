import 'package:flutter/material.dart';
import 'package:flutter_news_app/presentation/auth_screens/login_page.dart';
import 'package:flutter_news_app/presentation/screens/home_screen.dart';
import 'package:flutter_news_app/utilities/util_widgets.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  UtilWidgets utilWidgets = UtilWidgets();
  TextEditingController userController = TextEditingController();
  TextEditingController mobController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passController = TextEditingController();

  final GlobalKey<FormState> _form = GlobalKey<FormState>();

  bool isVisible = false;

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
        child: Column(children: [
          Expanded(
              flex: 7,
              child: Container(
                padding: const EdgeInsets.all(12.0),
                child: Card(
                  elevation: 12.0,
                  color: Colors.grey[100],
                  margin: const EdgeInsets.all(12.0),
                  child: Column(children: [
                    utilWidgets.userNameField(
                        userController: userController, fieldName: 'Username'),
                    utilWidgets.userNameField(
                        userController: mobController,
                        fieldName: 'Mobile Number'),
                    utilWidgets.userNameField(
                        userController: emailController, fieldName: 'Email'),
                    utilWidgets.passwordField(isVisible, () {
                      setState(() {
                        isVisible = !isVisible;
                      });
                    }, passController),
                    const Padding(padding: EdgeInsets.only(top: 4.0)),
                    utilWidgets.cupButton(
                        context: context,
                        buttonName: 'Register',
                        onTap: () {
                          if (validateForm() == true) {
                            Navigator.pushReplacement(
                                context,
                                PageTransition(
                                    child: const HomeScreen(),
                                    type: PageTransitionType.fade));
                          }
                        }),
                    const Padding(padding: EdgeInsets.only(top: 16.0)),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                child: const LoginPage(),
                                type: PageTransitionType.leftToRight));
                      },
                      child: RichText(
                        text: TextSpan(children: [
                          TextSpan(text: 'I\'m already an user ', style: style),
                          const TextSpan(
                              text: 'Login',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold))
                        ]),
                      ),
                    )
                  ]),
                ),
              )),
          Expanded(
            flex: 3,
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(top: 4.0),
              child: SvgPicture.asset('assets/register.svg'),
            ),
          ),
        ]),
      ),
    );
  }

  TextStyle style = const TextStyle(
      color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.bold);
}
