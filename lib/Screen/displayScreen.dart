import 'package:flutter/material.dart';
import 'package:sprinkle_architecture_tary/Manager/ExampleManager.dart';
import 'package:sprinkle_architecture_tary/Models/DirectModel.dart';
import 'package:sprinkle_architecture_tary/Widgets/Observer.dart';
import 'package:sprinkle_architecture_tary/main.dart';

class DirectPageExemple extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    ExampleManager manager = context.fetch<ExampleManager>();
    manager.inFilter.add('');

    return Scaffold(
      body: Container(
        child: Observer<List<Direct>>(
          stream: manager.browser$,
          onSuccess: (context, data) {
            return ListView.separated(
              itemBuilder: (context, index){
                Direct contact = data[index];
                return ListTile(
                  leading: CircleAvatar(),
                  title: Text(contact.auteur.username),
                  subtitle: Text(contact.titre),
                );
              } ,
              itemCount: data?.length ?? 0,
              separatorBuilder: (context, index) => Divider(),
            );
          }
        ),
      )
    );
  }
}



