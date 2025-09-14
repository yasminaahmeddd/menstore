part of '../secreens/home_page.dart';

class AllProductHomePage extends StatelessWidget {
  const AllProductHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductStates>(
      builder: (context, state) {
        if (state is ProductLoading) {
          return AppLoading();
        }
        if (state is ProductSuccess) {
          return Expanded(
            child: GridView.builder(
              itemCount: state.model.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.8,
                  mainAxisSpacing: 6,
                  crossAxisSpacing: 12),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder:
                            (context) =>
                             BlocProvider.value(
                                value: CartCubit(),
                              child: ProductDetailsScreen(
                                  model: state.model[index]),
                            ),));
                    },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: Image.network(state.model[index].image ?? ""),
                        ),
                        Text(
                          state.model[index].title ?? "",
                          style: AppTextStyles.kTextStyle16MediumBlack,
                          maxLines: 1,
                        ),
                        Text(
                          r"$" + state.model[index].price.toString(),
                          style: AppTextStyles.kTextStyle16Grey,
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        } else {
          return Container(
            color: Colors.orange,
          );
        }
      },
    );
  }
}
