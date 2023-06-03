import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:thrifty/models/product.dart';
import 'package:thrifty/route_constants.dart';
import 'package:thrifty/screens/check_out_screen/check_out_screen.dart';
import 'package:thrifty/screens/forget_password/forget_password_screen.dart';
import 'package:thrifty/screens/home/home_screen.dart';
import 'package:thrifty/screens/my_orders/my_orders_screen.dart';
import 'package:thrifty/screens/product_details/product_details_screen.dart';
import 'package:thrifty/screens/shopping_cart/shopping_cart_screen.dart';
import 'package:thrifty/screens/sign_up/sign_up_screen.dart';
import 'package:thrifty/screens/user_profile/user_profile_screen.dart';
import 'repository/auth_repo.dart';
import 'screens/sign_in/sign_in_screen.dart';

class AppRouter {
  GoRouter router = GoRouter(
    routes: [
      GoRoute(
        name: RouteConstants.signIn,
        path: '/',
        pageBuilder: (context, state) {
          return const MaterialPage(
            child: SignInScreen(),
          );
        },
      ),
      GoRoute(
        name: RouteConstants.cart,
        path: '/shopping_cart',
        pageBuilder: (context, state) {
          return const MaterialPage(
            child: ShoppingCartScreen(),
          );
        },
      ),
      GoRoute(
        name: RouteConstants.checkOut,
        path: '/check_out',
        pageBuilder: (context, state) {
          return const MaterialPage(
            child: CheckOutScreen(),
          );
        },
      ),
      GoRoute(
        name: RouteConstants.forgotPassword,
        path: '/forget_password',
        pageBuilder: (context, state) {
          return const MaterialPage(
            child: ForgetPasswordScreen(),
          );
        },
      ),
      GoRoute(
        name: RouteConstants.home,
        path: '/home',
        pageBuilder: (context, state) {
          return const MaterialPage(
            child: HomeScreen(),
          );
        },
      ),
      GoRoute(
        name: RouteConstants.productDetails,
        path: '/product_details/:id',
        pageBuilder: (context, state) {
          final id = state.pathParameters['id']!;
          return MaterialPage(
            child: ProductDetailsScreen(
              productId: id,
            ),
          );
        },
      ),
      GoRoute(
        name: RouteConstants.profile,
        path: '/profile',
        pageBuilder: (context, state) {
          return const MaterialPage(
            child: UserProfileScreen(),
          );
        },
      ),
      GoRoute(
        name: RouteConstants.myOrders,
        path: '/my_orders',
        pageBuilder: (context, state) {
          return const MaterialPage(
            child: MyOrdersScreen(),
          );
        },
      ),
      GoRoute(
        name: RouteConstants.signUp,
        path: '/sign_up',
        pageBuilder: (context, state) {
          return const MaterialPage(
            child: SignUpScreen(),
          );
        },
      ),
    ],
  );
}
