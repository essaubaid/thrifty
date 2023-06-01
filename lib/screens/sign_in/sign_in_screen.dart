import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../bloc/user_block.dart';
import '../../form_submission_status.dart';
import '../../repository/auth_repo.dart';
import '../../route_constants.dart';
import '../../size_config.dart';
import 'bloc/sign_in_bloc.dart';
import 'bloc/sign_in_state.dart';
import 'components/body.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  static String routeName = "/sign_in";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocProvider(
      create: (context) => SignInBloc(
        authRepo: context.read<AuthRepository>(),
        userBloc: context.read<UserBloc>(),
      ),
      child: BlocListener<SignInBloc, SignInState>(
        listener: (context, state) {
          // Navigate to home page when submission is successful
          if (state.formStatus is SubmissionSuccess) {
            context.replaceNamed(RouteConstants.home);
          }
          // Show error message when submission failed
          else if (state.formStatus is SubmissionFailed) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                    content: Text((state.formStatus as SubmissionFailed)
                        .exception
                        .toString())),
              );
          }
        },
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Sign In"),
          ),
          body: const Body(),
        ),
      ),
    );
  }
}
