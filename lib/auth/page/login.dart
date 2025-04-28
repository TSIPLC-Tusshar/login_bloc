import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_bloc/auth/bloc/login_bloc.dart';
import 'package:login_bloc/auth/page/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: BlocProvider(
        create: (context) => LoginBloc(),
        child: BlocConsumer<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginFailure) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
            } else if (state is LoginSuccess) {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(message: state.message),
                ),
                (route) => false,
              );
            }
          },

          builder: (context, state) {
            if (state is LoginLoading) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return SingleChildScrollView(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 20,
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Email",
                        alignLabelWithHint: true,
                      ),
                      controller: emailController,
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Password",
                        alignLabelWithHint: true,
                      ),
                      controller: passwordController,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.blueAccent,
                        backgroundColor: Colors.blue,
                        shape: ContinuousRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        fixedSize: Size.fromWidth(
                          MediaQuery.of(context).size.width,
                        ),
                      ),
                      onPressed:
                          () => {
                            BlocProvider.of<LoginBloc>(context).add(
                              LoginButtonPressed(
                                email: emailController.text.trim(),
                                password: passwordController.text.trim(),
                              ),
                            ),
                          },
                      child: const Text(
                        'Submit',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
