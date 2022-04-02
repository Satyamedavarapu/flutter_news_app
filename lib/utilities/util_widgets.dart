import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UtilWidgets {
  Widget userNameField({required TextEditingController userController, required String fieldName}) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextFormField(
        maxLines: 1,
        validator: (val) {
          if (val == null || val.isEmpty) {
            return 'This Field cannot be empty';
          } else {
            return null;
          }
        },
        style: const TextStyle(
            color: Colors.black,
            fontSize: 24.0,
            fontStyle: FontStyle.normal,
            decoration: TextDecoration.none),
        controller: userController,
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            errorStyle: const TextStyle(
                color: Colors.red, fontSize: 16.0, fontWeight: FontWeight.bold),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            hintText: fieldName,
            hintStyle: const TextStyle(
              fontSize: 18.0,
              color: Colors.black,
              decoration: TextDecoration.none,
            )),
      ),
    );
  }

  Widget passwordField(bool isVisible, VoidCallback setState,
      TextEditingController passwordController) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextFormField(
        maxLines: 1,
        validator: (val) {
          if (val == null || val.isEmpty) {
            return 'Password cannot be empty';
          } else {
            return null;
          }
        },
        style: const TextStyle(
            color: Colors.black,
            fontSize: 24.0,
            fontStyle: FontStyle.normal,
            decoration: TextDecoration.none),
        controller: passwordController,
        textInputAction: TextInputAction.send,
        keyboardType: TextInputType.text,
        obscureText: isVisible,
        decoration: InputDecoration(
            errorStyle: const TextStyle(
                color: Colors.red, fontSize: 16.0, fontWeight: FontWeight.bold),
            suffixIcon: IconButton(
              onPressed: setState,
              icon: Icon(
                isVisible ? Icons.visibility : Icons.visibility_off,
                size: 24.0,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            hintText: 'Password',
            hintStyle: const TextStyle(
              fontSize: 18.0,
              color: Colors.black,
              decoration: TextDecoration.none,
            )),
      ),
    );
  }

  Widget customError(
      {required BuildContext context,
      required String title,
      required String message,
      required VoidCallback onTap}) {
    return AlertDialog(
      backgroundColor: Colors.white,
      elevation: 24.0,
      title: Text(
        title,
        style: const TextStyle(
            color: Colors.black, fontSize: 24.0, fontWeight: FontWeight.bold),
      ),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text(
              message,
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 16.0),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('Done'),
          onPressed: onTap,
        ),
      ],
    );
  }


  Widget cupButton(
      {required BuildContext context,
      required String buttonName,
      required VoidCallback onTap}) {
    return CupertinoButton(
        child: Text(
          buttonName,
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        onPressed: onTap,
        alignment: Alignment.center,
        color: Colors.red,
        borderRadius: BorderRadius.circular(8.0));
  }

}
