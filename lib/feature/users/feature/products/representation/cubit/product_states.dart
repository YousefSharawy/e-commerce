abstract class ProductStates {}


class ProductInitState implements ProductStates{}
class GetProductsLoading implements ProductStates{}
class GetProductsSuccess implements ProductStates{}
class GetProductsError implements ProductStates{
  String message ;
  GetProductsError(this.message);

}


class GetProductLoading implements ProductStates{}
class GetProductSuccess implements ProductStates{}
class GetProductError implements ProductStates{
  String message ;
  GetProductError(this.message);

}
