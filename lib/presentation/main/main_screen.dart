import 'package:contacts_bloc/blocs/main/main_bloc.dart';
import 'package:contacts_bloc/domain/repository_v3.dart';
import 'package:contacts_bloc/presentation/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/delete/delete_bloc.dart';
import '../../blocs/main/main_state.dart';
import '../../data/model/firebase/contact_data_fb.dart';
import '../../utils/dialogs/delete.dart';
import '../../utils/dialogs/sign_out.dart';
import '../add/add_screen.dart';
import '../login/login_screen.dart';
import 'components/contact_item.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    BlocProvider.of<MainBloc>(context).add(LoadContactsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        forceMaterialTransparency: true,
        automaticallyImplyLeading: false,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: () {
                onClickLogout(
                  context,
                  onLogout: () async {
                    final res = await RepositoryV3().logout();
                    print('ON onLogout CLICK res = $res');

                    if (!context.mounted) return;

                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                      (Route<dynamic> route) => false,
                    );
                  },
                  onUnRegister: () async {
                    final res = await RepositoryV3().unregister();
                    print('on unregister click res = $res');

                    if (!context.mounted) return;

                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const SplashScreen()),
                      (Route<dynamic> route) => false,
                    );
                  },
                );
              },
              child: const CircleAvatar(
                backgroundImage: AssetImage('assets/icon_logout.png'),
              ),
            ),
          ),
        ],
        title: Text(
          'Contacts',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Colors.grey.shade500,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
      body: BlocBuilder<MainBloc, MainState>(
        builder: (context, state) {
          if (state is MainStateLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is MainStateLoaded) {
            return SafeArea(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Builder(
                  builder: (context) {
                    if (state.contacts.isEmpty) {
                      return Center(child: Text('No contacts found. Try add some', style: Theme.of(context).textTheme.bodyLarge,));
                    }
                    return ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: state.contacts.length,
                      itemBuilder: (_, index) => ContactItem(
                        contact: state.contacts[index],
                        onMoreClick: () {
                          _showDeleteDialog(state.contacts[index], () {
                            print('onclick delete in dialog');
                            context.read<DeleteBloc>().add(DeleteContactEvent(state.contacts[index]));
                            context.read<MainBloc>().add(LoadContactsEvent());

                            Navigator.of(context, rootNavigator: true).pop();
                          });
                        },
                      ),
                    );
                  }
                ),
              ),
            );
          } else if (state is MainStateError) {
            return Center(
              child: Text(state.message),
            );
          } else {
            return const Center();
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: GestureDetector(
        onTap: () {
          _navigateAndLoadContactsOnBack(context);
        },
        child: Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.red,
          ),
          padding: const EdgeInsets.all(1),
          child: Container(
            padding: const EdgeInsets.all(2),
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).primaryColor,
              ),
              child: const Icon(
                Icons.add,
                color: Colors.white,
                size: 48,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _navigateAndLoadContactsOnBack(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddScreen()),
    );
    if (result != null && result) {
      BlocProvider.of<MainBloc>(context).add(LoadContactsEvent());
    }
  }

  void onClickLogout(BuildContext context, {required VoidCallback onUnRegister, required VoidCallback onLogout}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          elevation: 5.0,
          backgroundColor: Colors.white,
          child: signOutDialog(
            context: context,
            close: () {
              Navigator.of(context, rootNavigator: true).pop();
            },
            onUnRegister: onUnRegister,
            onLogout: onLogout,
          ),
        );
      },
    );
  }

  void _showDeleteDialog(ContactDataFb contact, VoidCallback deleteContact) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: deleteDialog(
            context: context,
            contactName: contact.name,
            close: () {
              Navigator.of(context, rootNavigator: true).pop();
            },
            deleteContact: deleteContact,
          ),
        );
      },
    );
  }
}
