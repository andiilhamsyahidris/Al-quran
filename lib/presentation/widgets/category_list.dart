import 'package:alquran/common/constant.dart';
import 'package:flutter/material.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 64,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RawChip(
              padding: const EdgeInsets.all(8.0),
              label: const Text('All'),
              labelStyle: Theme.of(context)
                  .textTheme
                  .subtitle2!
                  .copyWith(color: Colors.white),
              backgroundColor: kDarkPurple,
            ),
            const SizedBox(
              width: 10,
            ),
            RawChip(
              padding: const EdgeInsets.all(8.0),
              label: const Text('Meccan'),
              labelStyle: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Colors.white),
              backgroundColor: kDarkPurple,
            ),
            const SizedBox(
              width: 10,
            ),
            RawChip(
              padding: const EdgeInsets.all(8.0),
              label: const Text('Medina'),
              labelStyle: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Colors.white),
              backgroundColor: kDarkPurple,
            ),
          ],
        ));
  }
}
