import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/main/main_bloc.dart';
import '../../../data/model/firebase/contact_data_fb.dart';
import '../../update/update_screen.dart';

class ContactItem extends StatelessWidget {
  final ContactDataFb contact;
  final VoidCallback onMoreClick;

  const ContactItem({super.key, required this.contact, required this.onMoreClick});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _navigateAndLoadContactsOnBack(context, contact);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const CircleAvatar(
              backgroundImage: AssetImage('assets/icon_add.png'),
            ),
            title: Text(
              contact.name,
              style: Theme
                  .of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(
                color: Colors.black,
              ),
            ),
            subtitle: Text(
              contact.phone,
              style: Theme
                  .of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(
                color: Colors.grey.shade500,
              ),
            ),
            trailing: IconButton(
              icon: const Icon(
                Icons.more_horiz,
                size: 36,
              ),
              color: Colors.grey.shade500,
              onPressed: () {
                onMoreClick();
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Divider(height: 1, color: Colors.grey.shade500),
          )
        ],
      ),
    );
  }

  Future<void> _navigateAndLoadContactsOnBack(BuildContext context, ContactDataFb contactData) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => UpdateScreen(contact: contactData)),
    );
    if (result != null && result) {
      BlocProvider.of<MainBloc>(context).add(LoadContactsEvent());
    }
  }
}
