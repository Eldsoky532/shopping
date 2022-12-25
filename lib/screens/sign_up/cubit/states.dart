abstract class ShoppingRegisiterStates{}

class ShoppingRegisInitialState extends ShoppingRegisiterStates{}

class ShoppingRegisloadingState extends ShoppingRegisiterStates{}

class ShoppingRegisSucessState extends ShoppingRegisiterStates{

}


class ShoppingRegisErrorState extends ShoppingRegisiterStates{

  final String error;
  ShoppingRegisErrorState(this.error);


}
