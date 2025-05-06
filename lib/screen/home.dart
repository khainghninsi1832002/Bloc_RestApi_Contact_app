import 'package:blocrestapicontactapplication/bloc/get/cubit/getcontact_cubit.dart';
import 'package:blocrestapicontactapplication/data/model/contact.dart';
import 'package:blocrestapicontactapplication/screen/add_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<GetcontactCubit>(context)
        .getContact(); //screenလာလာချင်း dataလမ်းယူမယ်
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact List'),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () async {
            var result = await Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => AddScreen()));
            if (result != null && result == 'success') {
              BlocProvider.of<GetcontactCubit>(context).getContact();
            }
          }),
      body: BlocBuilder<GetcontactCubit, GetcontactState>(
          builder: (context, state) {
        if (state is GetcontactSuccess) {
          List<Contact> contacts = state.contacts;
          return ListView.builder(
            itemCount: contacts.length,
            itemBuilder: (context, position) {
              return item(contacts[position]);
            },
          );
        }
        return Center(child: CircularProgressIndicator());
      }),
    );
  }

  Widget item(Contact contact) {
    return Card(
      child: ListTile(
        title: Text(contact.name),
        subtitle: Text(contact.job),
        trailing: Text('age : ${contact.age}'),
      ),
    );
  }
}
