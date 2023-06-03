import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:thrifty/bloc/user_block.dart';
import 'package:thrifty/screens/sign_up/bloc/sign_up_bloc.dart';
import '../../components/custom_app_bar.dart';
import '../../form_submission_status.dart';
import '../../repository/auth_repo.dart';
import '../../route_constants.dart';
import 'bloc/sign_up_event.dart';
import 'bloc/sign_up_state.dart';
import 'components/body.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: BlocProvider(
        create: (context) => SignUpBloc(
          userBloc: context.read<UserBloc>(),
          authRepo: context.read<AuthRepository>(),
        ),
        child: BlocListener<SignUpBloc, SignUpState>(
          listener: (context, state) {
            // Navigate to home page when submission is successful
            if (state.formStatus is SubmissionSuccess) {
              context.replaceNamed(RouteConstants.home);
            }
            // Show error message when submission failed
            else if (state.formStatus is SubmissionFailed) {
              final snackBar = SnackBar(
                content: Text(
                  (state.formStatus as SubmissionFailed).exception.toString(),
                  style: const TextStyle(color: Colors.white),
                ),
                backgroundColor: Colors.red,
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(5.0), // Make it rectangular
                ),
                duration:
                    const Duration(seconds: 3), // Auto-hide after 3 seconds
              );
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(snackBar);

              // Reset the form status to idle
              context.read<SignUpBloc>().add(FormReset());
            }
          },
          child: const Body(),
        ),
      ),
    );
  }
}
