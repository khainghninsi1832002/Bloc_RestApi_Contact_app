import 'package:blocrestapicontactapplication/bloc/post/cubit/postcontact_cubit.dart';
import 'package:blocrestapicontactapplication/data/model/contact.dart';
import 'package:blocrestapicontactapplication/module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PostcontactCubit>(
      create: (context) => PostcontactCubit(getIt.call()),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Add Contact'),
        ),
        body: BlocBuilder<PostcontactCubit, PostcontactState>(
            builder: (context, state) {
          if (state is PostcontactLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is PostcontactSuccess) {
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
            if (state is PostcontactFail) {
              return Center(child: Text(state.error));
            }
          }
          return ContactForm();
        }),
      ),
    );
  }
}

class ContactForm extends StatefulWidget {
  const ContactForm({super.key});

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final _formKey = GlobalKey<FormState>();
  String? _name, _job, _age;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        padding: const EdgeInsets.all(.0),
        children: [
          TextFormField(
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
                Contact contact = Contact(null, _name!, _job!, _age!);
                context.read<PostcontactCubit>().addContact(contact);
              }
            },
            child: Text('Add Contact'),
          ),
        ],
      ),
    );
  }
}
