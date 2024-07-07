import 'package:bloc_example/model/user_model.dart';
import 'package:bloc_example/screen/home/cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<UserCubit>().getAllUSer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<UserCubit,UserState>(
          builder: (context, state) {
            if (state is UserSuccess) {
              return listUserWidget(state.allUser);
            } else if (state is UserError) {
              return Center(child: Text(state.error));
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}

Widget listUserWidget(List<UserModel> allUser) {
  return ListView.builder(
    itemBuilder: (context, index) {
      return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          child: Card(
            color: Theme.of(context).primaryColor,
            child: ListTile(
              title: Text(allUser[index].firstName!),
              subtitle: Text(allUser[index].email!),
              leading: CircleAvatar(
                backgroundImage:
                    NetworkImage(allUser[index].avatar!.toString()),
              ),
            ),
          ));
    },
    itemCount: allUser.length,
  );
}
