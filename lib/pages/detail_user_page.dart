// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mini_project/blocs/user/user_bloc.dart';
import 'package:flutter_mini_project/models/user_detail_model.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailUserPage extends StatelessWidget {
  final int id;
  const DetailUserPage({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Single User',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: BlocProvider(
        create: (context) => UserBloc()..add(UserDetail(id)),
        child: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is UserLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is UserDetailSuccess) {
              UserDetailModel user = state.user;

              return Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.black,
                            image: DecorationImage(
                              image: NetworkImage(user.avatar.toString()),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${user.firstName} ${user.lastName}",
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            Text(
                              user.email.toString(),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    const Divider(
                      thickness: 2,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    InkWell(
                      onTap: () async {
                        if (await canLaunchUrl(
                          Uri.parse('https://reqres.in/#support-heading'),
                        )) {
                          await launchUrl(
                            Uri.parse('https://reqres.in/#support-heading'),
                          );
                        }
                      },
                      child: const Text(
                        'Support',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                        'To keep ReqRes free, contributions towards server costs are appreciated!')
                  ],
                ),
              );
            }

            return const Center(
              child: Text('Tidak dapat mengambil data'),
            );
          },
        ),
      ),
    );
  }
}
