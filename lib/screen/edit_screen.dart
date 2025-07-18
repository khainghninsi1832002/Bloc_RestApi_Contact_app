import 'package:blocrestapicontactapplication/bloc/post/cubit/postcontact_cubit.dart';
import 'package:blocrestapicontactapplication/bloc/put/cubit/editcontact_cubit.dart';
import 'package:blocrestapicontactapplication/data/model/contact.dart';
import 'package:blocrestapicontactapplication/module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditScreen extends StatelessWidget {
  final Contact _contact;
  EditScreen(this._contact);
  @override
  Widget build(BuildContext context) {
    return BlocProvider<EditcontactCubit>(
      create: (context) => EditcontactCubit(getIt.call()),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Edit Contact'),
        ),
        body: BlocBuilder<EditcontactCubit, EditcontactState>(
            builder: (context, state) {
          if (state is EditcontactLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is EditcontactSuccess) {
            return Center(
              child: Column(
                children: [
                  Text('Success'),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context, 'success');
                    },
                    child: Text('Go Home'),
                  ),
                ],
              ),
            );
          } else {
            if (state is EditcontactFail) {
              return Center(child: Text(state.error));
            }
          }
          return ContactForm(this._contact);
        }),
      ),
    );
  }
}

class ContactForm extends StatefulWidget {
  final Contact _contact;
  ContactForm(this._contact);

  @override
  State<ContactForm> createState() => _ContactFormState(this._contact);
}

class _ContactFormState extends State<ContactForm> {
  final _formKey = GlobalKey<FormState>();
  String? _name, _job, _age;

  final Contact _contact;
  _ContactFormState(this._contact);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        padding: const EdgeInsets.all(.0),
        children: [
          TextFormField(
            initialValue: _contact.name,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter your name',
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please Enter Your Name';
              }
              return null;
            },
            onSaved: (value) {
              this._name = value;
            },
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            initialValue: _contact.age,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter your age',
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please Enter Your Age';
              }
              return null;
            },
            onSaved: (value) {
              this._age = value;
            },
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            initialValue: _contact.job,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter your job',
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please Enter Your Job';
              }
              return null;
            },
            onSaved: (value) {
              this._job = value;
            },
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                Contact contact = Contact(_contact.id, _name!, _job!, _age!);
                // context.bloc<EditcontactCubit>().edit(_contact.id, contact);
                BlocProvider.of<EditcontactCubit>(context)
                    .edit(_contact.id.toString(), contact);
              }
            },
            child: Text('Edit Contact'),
          ),
        ],
      ),
    );
  }
}
