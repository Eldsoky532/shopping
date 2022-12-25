abstract class ShopStates{}

class ShopInitialState extends ShopStates{}

class ShoppingnavInitialState extends ShopStates{}


class ShoppingchangeBottomNav extends ShopStates{}

class Shoppingsignup extends ShopStates{}


class ShopLoadingHomeDataState extends ShopStates{}

class ShopSucessHomeDataState extends ShopStates{}

class ShopErrorHomeDataState extends ShopStates{}

class ShopLoadingCategoriesState extends ShopStates{}

class ShopSuccessCategoriesState extends ShopStates{}

class ShopErrorCategoriesState extends ShopStates{
  String error;
  ShopErrorCategoriesState(this.error);
}

class ShopgetdateloadingState extends ShopStates{}
class ShopgetdatescuessState extends ShopStates{}

class ShopgetdateerrorState extends ShopStates{
  String error;
  ShopgetdateerrorState(this.error);
}


