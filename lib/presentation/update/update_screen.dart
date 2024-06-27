import 'package:contacts_bloc/blocs/update/update_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/firebase/contact_data_fb.dart';
import '../../utils/components/components.dart';

class UpdateScreen extends StatefulWidget {
  final ContactDataFb contact;

  const UpdateScreen({super.key, required this.contact});

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  var userNameController = TextEditingController();
  var phoneController = TextEditingController();
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
                textField(hintText: "Username", fieldController: userNameController, defValue: widget.contact.name),
                const SizedBox(height: 20),
                textField(
                  hintText: "Phone",
                  fieldController: phoneController,
                  defValue: widget.contact.phone,
                  inputType: TextInputType.phone,
                ),
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
                        final contact = ContactDataFb(
                          id: widget.contact.id,
                          imagePath: widget.contact.imagePath,
                          name: userNameController.text,
                          phone: phoneController.text,
                        );

                        print('Edited contact : $contact');

                        context.read<UpdateBloc>().add(UpdateContactEvent(contact));
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
