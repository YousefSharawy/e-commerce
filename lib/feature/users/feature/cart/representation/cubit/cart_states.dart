abstract class CartStates {}

class CartInitState implements CartStates {}

class GetCartLoading implements CartStates {}

class GetCartSuccess implements CartStates {}

class GetCartError implements CartStates {
  final String message;
  GetCartError(this.message);
}

class AddCardLoading implements CartStates {}

class AddCartSuccess implements CartStates {}

class AddCartError implements CartStates {
  final String message;
  AddCartError(this.message);
}

class UpdateCartLoading implements CartStates {}

class UpdateCartSuccess implements CartStates {}

class UpdateCartError implements CartStates {
  final String message;
  UpdateCartError(this.message);
}

class AddProductLoading implements CartStates {}

class AddProductSuccess implements CartStates {}

class AddProductError implements CartStates {
  final String message;
  AddProductError(this.message);
}

class DeleteProductLoading implements CartStates {}

class DeleteProductSuccess implements CartStates {}

class DeleteProductError implements CartStates {
  final String message;
  DeleteProductError(this.message);
}
