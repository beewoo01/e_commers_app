import 'package:e_commerce_app/core/theme/constant/app_icons.dart';
import 'package:e_commerce_app/core/theme/custom/custom_font_weight.dart';
import 'package:e_commerce_app/core/theme/custom/custom_theme.dart';
import 'package:e_commerce_app/core/utils/constans.dart';
import 'package:e_commerce_app/core/utils/extensions.dart';
import 'package:e_commerce_app/dependency_injection.dart';
import 'package:e_commerce_app/domain/model/display/cart/cart.model.dart';
import 'package:e_commerce_app/presentation/main/bloc/payment_bloc/payment_bloc.dart';
import 'package:e_commerce_app/presentation/main/component/payment/payment_button.dart';
import 'package:e_commerce_app/presentation/main/component/top_app_bar/widgets/svg_icon_button.dart';
import 'package:e_commerce_app/presentation/pages/cart_list/bloc/cart_list_bloc/cart_list_bloc.dart';
import 'package:e_commerce_app/presentation/pages/cart_list/component/cart_product_card.dart';
import 'package:e_commerce_app/presentation/pages/cart_list/component/cart_total_price.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CartListPage extends StatelessWidget {
  const CartListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: BlocProvider.of<CartListBloc>(context)..add(CartListInitialized()),
      child: const CartListPageView(),
    );
  }
}

class CartListPageView extends StatelessWidget {
  const CartListPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return BlocProvider(
      create: (_) => getIt<PaymentBloc>(),
      child: Scaffold(
        appBar: AppBar(
          leading: Center(
            child: SvgIconButton(
              icon: AppIcons.close,
              color: colorScheme.contentPrimary,
              onPressed: () {
                if (context.canPop()) {
                  context.pop();
                }
              },
            ),
          ),
          title: Text(
            '장바구니',
            style: textTheme.titleMedium.semiBold?.copyWith(
              color: colorScheme.contentPrimary,
            ),
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(48),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: BlocBuilder<CartListBloc, CartListState>(
                builder: (_, state) {
                  final bool isSelectedAll =
                      state.selectedProduct.length == state.cartList.length &&
                      state.cartList.isNotEmpty;

                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SvgIconButton(
                            icon: (isSelectedAll)
                                ? AppIcons.checkMarkCircleFill
                                : AppIcons.checkMarkCircle,
                            color: (isSelectedAll)
                                ? colorScheme.primary
                                : colorScheme.contentFourth,
                            onPressed: () => context.read<CartListBloc>().add(
                              CartListSelectedAll(),
                            ),
                          ),

                          const SizedBox(width: 8),
                          Text(
                            '전체 선택 (${state.selectedProduct.length}/${state.cartList.length})',
                            style: textTheme.titleSmall?.copyWith(
                              color: colorScheme.contentPrimary,
                            ),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () => context.read<CartListBloc>().add(
                          CartListDeleted(productIds: state.selectedProduct),
                        ),
                        child: Text(
                          '선택 삭제',
                          style: textTheme.titleSmall.semiBold?.copyWith(
                            color: colorScheme.contentSecondary,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          centerTitle: true,
        ),

        body: BlocBuilder<CartListBloc, CartListState>(
          builder: (_, state) {
            switch (state.status) {
              case Status.initial:
              case Status.loading:
              case Status.error:
                return const Center(child: CircularProgressIndicator());
              case Status.success:
                return ListView(
                  children: [
                    Divider(
                      height: 8,
                      thickness: 8,
                      color: colorScheme.surface,
                    ),
                    Column(
                      children: List.generate(
                        state.cartList.length,
                        (index) => CartProductCard(cart: state.cartList[index]),
                      ),
                    ),
                    CartTotalPrice(isEmpty: state.cartList.isEmpty),
                  ],
                );
            }
          },
        ),
        bottomNavigationBar: SafeArea(
          child: BlocBuilder<CartListBloc, CartListState>(
            builder: (context, state) {
              List<Cart> selectedCartList = state.cartList.fold([], (
                previousValue,
                cart,
              ) {
                if (state.selectedProduct.contains(cart.product.productId)) {
                  previousValue.add(cart);
                }

                return previousValue;
              });
              return state.status.isSuccess
                  ? PaymentButton(
                      selectedCartList: selectedCartList,
                      totalPrice: state.totalPrice,
                    )
                  : SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}
