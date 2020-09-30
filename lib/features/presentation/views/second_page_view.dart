import 'package:flutter/material.dart';
import 'package:login/features/presentation/scoped_models/second_page_view_model.dart';

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
                title: Text("Report an Issue"),
              ),
              body: Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        model.email,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Image.asset("assets/images/lady.png"),
                    SizedBox(
                      height: 20,
                    ),
                    //      InputHelpers.inputField(controller: nameContoll),
                    Container(
                      height: 150,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                        border: Border(
                          top: BorderSide(width: 1, color: Colors.purple),
                          bottom: BorderSide(width: 1, color: Colors.purple),
                          left: BorderSide(width: 1, color: Colors.purple),
                          right: BorderSide(width: 1, color: Colors.purple),
                        ),
                      ),
                      child: TextField(
                        controller: nameContoll,
                        maxLines: 10,
                        decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.only(bottom: -5, left: 10, top: 10),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () => model.setUserEmail(nameContoll.text),
                      child: Card(
                        elevation: 5,
                        child: Container(
                          height: 50,
                          child: Center(
                            child: Text("Report Issue"),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
//                    Container(
//                      decoration: BoxDecoration(
//                          borderRadius: BorderRadius.circular(10),
//                          boxShadow: [
//                            BoxShadow(
//                                color: Colors.grey.shade300,
//                                blurRadius: 16,
//                                spreadRadius: 0)
//                          ]),
//                      child: Container(
//                        height: 50,
//                        color: Colors.white,
//                        child: Center(
//                          child: Text(model.email),
//                        ),
//                      ),
//                    ),
                  ],
                ),
              ),
            )));
  }
}
