import 'package:contacts_bloc/data/model/firebase/contact_data_fb.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/add/add_bloc.dart';
import '../../utils/components/components.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final userNameController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddBloc(),
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
                textField(hintText: "Name", fieldController: userNameController),
                const SizedBox(height: 20),
                textField(hintText: "Phone", fieldController: phoneController, inputType: TextInputType.phone),
                const Spacer(),
                BlocConsumer<AddBloc, AddState>(
                  listener: (context, state) {
                    if (state is AddSuccess) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(state.message),
                        ),
                      );
                      Navigator.pop(context, true);
                    } else if (state is AddError) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(state.message),
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state is AddLoading) {
                      return const Center(
                        child: SizedBox(
                          height: 30,
                          width: 30,
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }
                    return button(
                      context: context,
                      text: "Add",
                      onPressed: () {
                        print('on Press add');
                        context.read<AddBloc>().add(
                          AddContactEvent(
                            contactData: ContactDataFb(
                              name: userNameController.text,
                              phone: phoneController.text,
                              imagePath: '',
                              id: '0',
                            ),
                          ),
                        );
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
