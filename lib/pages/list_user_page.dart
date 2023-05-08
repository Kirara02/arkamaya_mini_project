import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mini_project/blocs/user/user_bloc.dart';
import 'package:flutter_mini_project/pages/detail_user_page.dart';
import 'package:flutter_mini_project/widgets/user_item.dart';

class ListUserPage extends StatefulWidget {
  const ListUserPage({super.key});

  @override
  State<ListUserPage> createState() => _ListUserPageState();
}

class _ListUserPageState extends State<ListUserPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(
        top: 40,
        bottom: 24,
        left: 24,
        right: 24,
      ),
      children: [
        const Text(
          'List Users',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        BlocProvider(
          create: (context) => UserBloc()..add(UserGet()),
          child: BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              print(state);
              if (state is UserSuccess) {
                return Column(
                  children: state.users
                      .map(
                        (user) => UserItem(
                          user: user,
                        ),
                      )
                      .toList(),
                );
              }

              if (state is UserLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              return const Center(
                child: Text('Tidak dapat memuat data'),
              );
            },
          ),
        )
      ],
    );
  }
}
