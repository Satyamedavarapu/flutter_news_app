import 'package:flutter/material.dart';

class PopRow {


  Widget topRow(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          const Expanded(
            flex: 2,
            child: CircleAvatar(
              radius: 28.0,
            ),
          ),
          Expanded(
            flex: 8,
            child: SizedBox(
              height: 48.0,
              child: TextFormField(
                maxLines: 1,
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return 'Please enter sonething';
                  } else {
                    return null;
                  }
                },
                style: Theme.of(context).textTheme.bodyText1,
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    errorStyle: Theme.of(context).textTheme.caption,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32.0),
                    ),
                    hintText: 'Search News',
                    hintStyle: Theme.of(context).textTheme.bodyText1),
              ),
            ),
          ),
        ],
      ),
    );
  }



}