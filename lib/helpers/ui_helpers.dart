import 'package:flutter/material.dart';

class InputHelpers {

    static Widget inputField(
      {String title,
      String placeholder,
      TextInputType keyboard,
      Function action,
      IconButton icon,
      @required TextEditingController controller,
      String validationMessage,
      bool isPassword = false,
      double spaceBetweenTitle = 5.0,
      double padding = 5.0}) {



    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        validationMessage != null
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(validationMessage,
                    style: TextStyle(color: Colors.red[400], fontSize: 12.0)),
              )
            : Container(),
        Padding(
          padding: EdgeInsets.only(top: 1, bottom: 1),
          child: TextField(
            onEditingComplete: action,
            autofocus: true,
            autocorrect: false,
            maxLines: 1,
            style: TextStyle(fontSize: 20 ), 
            controller: controller,
            obscureText: isPassword,
            keyboardType: keyboard,
            decoration: InputDecoration(
              suffixIcon: icon,
              labelText: placeholder,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.white)),
            ),
          ),
        ),
      ],
    );
  }

  static Widget inputFormField(
      {String title,
      String placeholder,
      TextInputType keyboard,
      Function action,
      IconButton icon,
       TextEditingController controller,
      String validationMessage,
      bool isPassword = false,
      double spaceBetweenTitle = 5.0,
      Function validator,
      double padding = 5.0}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        validationMessage != null
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(validationMessage,
                    style: TextStyle(color: Colors.red[400], fontSize: 12.0)),
              )
            : Container(),
        Padding(
          padding: EdgeInsets.only(top: 1, bottom: 1),
          child: TextFormField(
            onEditingComplete: action,
            autofocus: true,
            autocorrect: false,
            maxLines: 1,
            style: TextStyle(fontSize: 20 ), 
            controller: controller,
            obscureText: isPassword,
            keyboardType: keyboard,
            validator: validator,
            decoration: InputDecoration(
              suffixIcon: icon,
              labelText: placeholder,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.white)),
            ),
          ),
        ),
      ],
    );
  }

static Widget fullScreenButton(
      {@required String title, @required Function onTap,
      Color buttonColor,
      Color buttunTextColor,
      }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 50.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0), color: buttonColor),
        child: Center(
          child: Text(
            title,
            style: TextStyle(fontWeight: FontWeight.w500, color: buttunTextColor),
          ),
        ),
      ),
    );
  }

}