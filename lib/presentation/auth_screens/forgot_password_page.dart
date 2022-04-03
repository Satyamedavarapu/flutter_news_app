import 'package:flutter/material.dart';
import 'package:flutter_news_app/presentation/auth_screens/login_page.dart';
import 'package:flutter_news_app/utilities/util_widgets.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  UtilWidgets utilWidgets = UtilWidgets();

  TextEditingController userController = TextEditingController();

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
            children: [
              Expanded(
                  flex: 4,
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.only(top: 4.0),
                    child: SvgPicture.asset('assets/forgot.svg'),
                  )),
              Expanded(
                  flex: 5,
                  child: Card(
                    elevation: 12.0,
                    color: Colors.grey[100],
                    margin: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Password Reset Link will be sent to Email',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        utilWidgets.userNameField(
                            userController: userController, fieldName: 'Email'),
                        utilWidgets.cupButton(
                            context: context,
                            buttonName: 'Submit',
                            onTap: () {
                              if (validateForm() == true) {
                                Navigator.pushReplacement(
                                    context,
                                    PageTransition(
                                        child: const LoginPage(),
                                        type: PageTransitionType.fade));
                              }
                            })
                      ],
                    ),
                  )),
              Expanded(flex: 2, child: Container()),
            ],
          )),
    );
  }
}
