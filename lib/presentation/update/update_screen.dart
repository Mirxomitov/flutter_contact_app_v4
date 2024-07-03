import 'package:contacts_bloc/blocs/update/update_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/firebase/contact_data_fb.dart';
import '../../utils/components/components.dart';
import '../../utils/components/phone_field.dart';

class UpdateScreen extends StatefulWidget {
  final ContactDataFb contact;

  const UpdateScreen({super.key, required this.contact});

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  var userNameController = TextEditingController();
  var phoneController = TextEditingController();

  @override
  void initState() {
    phoneController.text = widget.contact.phone;
    userNameController.text = widget.contact.name;
    super.initState();
  }

  @override
  void dispose() {
    userNameController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  var isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UpdateBloc(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const Spacer(),
                Image.asset('assets/icon_login.png', width: 120, height: 120),
                const Spacer(),
                const SizedBox(height: 20),
                textField(hintText: "Username", fieldController: userNameController),
                const SizedBox(height: 20),
                PhoneField(fieldController: phoneController),
                const Spacer(),
                BlocConsumer<UpdateBloc, UpdateState>(
                  listener: (context, state) {
                    if (state is UpdateSuccess) {
                      Navigator.pop(context, true);
                    } else if (state is UpdateFailure) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Error occurred"),
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state is UpdateLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    return button(
                      context: context,
                      text: "Update",
                      onPressed: () {
                        // user name length should be at least 4
                        if (userNameController.text.length < 4) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Name should be at least 4 characters'),
                            ),
                          );
                          return;
                        }

                        // phone number length should be at least 12 and start with +998
                        if (phoneController.text.length < 12 || !phoneController.text.startsWith('+998')) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Phone number should be at least 12 characters and start with +998'),
                            ),
                          );
                          return;
                        }

                        final contact = ContactDataFb(
                          id: widget.contact.id,
                          imagePath: widget.contact.imagePath,
                          name: userNameController.text,
                          phone: phoneController.text,
                        );

                        print('Edited contact : $contact');

                        context.read<UpdateBloc>().add(UpdateContactEvent(newContactData: contact, oldContactData: widget.contact));
                      },
                    );
                  },
                ),
                const Spacer(flex: 3),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
