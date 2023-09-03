import 'package:effective/block/cart_state.dart';
import 'block.dart';

class CartBlock extends AppBlock<CartState> {
  CartBlock({required super.repository, required super.type});

  String totalPriceOneProduct(int index) =>
      '\$ ${((repository.cart?.basket?[index]?.price ?? 0) * (repository.cart?.basket?[index]?.quantity ?? 0)).toStringAsFixed(2)}';

  decrement(int index) {
    repository.decrement(index);
    emit(UpdateCartState(cart: List.from(repository.cart?.basket ?? [])));
  }

  increment(int index) {
    repository.increment(index);

    emit(UpdateCartState(cart: List.from(repository.cart?.basket ?? [])));
  }

  remove(int index) {
    repository.remove(index);
    emit(UpdateCartState(cart: List.from(repository.cart?.basket ?? [])));
  }
}
