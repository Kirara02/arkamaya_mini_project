import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mini_project/blocs/user/user_bloc.dart';
import 'package:flutter_mini_project/models/form_add_model.dart';
import 'package:flutter_mini_project/widgets/forms.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddUserPage extends StatefulWidget {
  const AddUserPage({super.key});

  @override
  State<AddUserPage> createState() => _AddUserPageState();
}

class _AddUserPageState extends State<AddUserPage> {
  TextEditingController name = TextEditingController(text: '');
  TextEditingController job = TextEditingController(text: '');

  void saveButton() {
    if (name.text.isNotEmpty && job.text.isNotEmpty) {
      context.read<UserBloc>().add(
            UserCreate(
              FormAddModel(
                name: name.text,
                job: job.text,
              ),
            ),
          );

      name.text = "";
      job.text = "";
    } else {
      Fluttertoast.showToast(
        msg: "Error, isi nama dan job terlebih dahulu",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 3,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserBloc, UserState>(
      listener: (context, state) {
        if (state is UserFailed) {
          Fluttertoast.showToast(
            msg: "Gagal menambah user",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.grey,
            textColor: Colors.white,
            fontSize: 16.0,
          );
        }

        if (state is UserAddSuccess) {
          Fluttertoast.showToast(
            msg:
                "Data has been created: \n ID: ${state.user.id} \n createdAt: ${state.user.createdAt}",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 6,
            backgroundColor: Colors.grey,
            textColor: Colors.white,
            fontSize: 16.0,
          );
        }
      },
      builder: (context, state) {
        if (state is UserLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return ListView(
          padding: const EdgeInsets.only(
            top: 40,
            bottom: 24,
            left: 24,
            right: 24,
          ),
          children: [
            const Text(
              'Create',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Forms(
              title: 'Name',
              controller: name,
            ),
            Forms(
              title: 'Job',
              controller: job,
            ),
            const SizedBox(
              height: 25,
            ),
            GestureDetector(
              onTap: saveButton,
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey[300],
                ),
                child: const Center(
                  child: Text(
                    'Save',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
