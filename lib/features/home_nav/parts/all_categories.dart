part of '../secreens/home_page.dart';

class AllCategories extends StatelessWidget {
  const AllCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        final cubit = context.read<CategoryCubit>();
        if (state is CategoryLoading) {
          return SizedBox.shrink();
        }
        if (state is CategorySuccess) {
          return SizedBox(
            height: 40,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.list.length,
              itemBuilder: (context, index) {
                final isSelected = state.index == index;
                return InkWell(
                  onTap: () {
                    cubit.changeIndex(index);
                    if (state.list[index] == 'All') {
                      BlocProvider.of<ProductCubit>(context).getAllProducts();
                    } else {
                      BlocProvider.of<ProductCubit>(context)
                          .updateCategoryProduct(state.list[index]);

                      // cubit.updateCategoryProduct(state.list[index]);
                    }
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 5, vertical: 4),
                    decoration: BoxDecoration(
                        boxShadow: [BoxShadow(blurRadius: 2)],
                        color:
                            isSelected ? AppColors.primaryColor : Colors.white,
                        borderRadius: BorderRadius.circular(12)),
                    width: 120,
                    height: 36,
                    child: Center(
                        child: Text(
                      state.list[index].toString(),
                      style: TextStyle(
                          color: isSelected
                              ? Colors.white
                              : AppColors.primaryColor),
                    )),
                  ),
                );
              },
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
