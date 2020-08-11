import 'package:flutter/material.dart';
import 'package:login/helpers/ui_helpers.dart';
import 'package:login/scoped_models/second_page_view_model.dart';

import 'base_view.dart';

class SecondPageView extends StatelessWidget {
  String email;
  TextEditingController nameContoll = TextEditingController();
  SecondPageView({this.email});

  @override
  Widget build(BuildContext context) {
    return BaseView<SecondPageViewModel>(
        onModelReady: (model) => model.setUserEmail(email),
        builder: (context, child, model) => Scaffold(
            backgroundColor: Theme.of(context).backgroundColor,
            body: Scaffold(
              appBar: AppBar(
                title: Text("Second Screen"),
              ),
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InputHelpers.inputField(controller: nameContoll),
                  Card(
                    elevation: 5,
                    child: Container(
                      height: 50,
                      child: Center(
                        child: Text(model.email),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.shade300,
                              blurRadius: 16,
                              spreadRadius: 0)
                        ]),
                    child: Container(
                      height: 50,
                      color: Colors.white,
                      child: Center(
                        child: Text(model.email),
                      ),
                    ),
                  ),
                  InputHelpers.fullScreenButton(
                      title: "Update Name",
                      onTap: () => model.setUserEmail(nameContoll.text)),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 50,
                        width: 30,
                        color: Colors.red,
                      ),
                      Container(
                        height: 50,
                        width: 30,
                        color: Colors.yellow,
                      ),
                      Container(
                        color: Colors.green,
                        height: 50,
                        width: 30,
                      ),
                    ],
                  ),
                ],
              ),
            )));
  }
}
