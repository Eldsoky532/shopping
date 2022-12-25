abstract class ShoppingLoginStates {}
class ShoppingLoginInitialState extends ShoppingLoginStates {}

class ShoppingLoginLoadingState extends ShoppingLoginStates {}

class ShoppingLoginSuccessState extends ShoppingLoginStates
{

}

class ShoppingLoginErrorState extends ShoppingLoginStates
{
  final String error;

  ShoppingLoginErrorState(this.error);
}

class ShoppingChangePasswordVisibilityState extends ShoppingLoginStates {}
