import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/data/models/app_user_model.dart';
import '../../../../core/providers/app_user_provider.dart';
import '../../data/models/transaction_model.dart';

part 'categories_provider.g.dart';

@riverpod
List<CategoryModel> getCategories(Ref ref) {
  final AppUser user = ref.watch(appUserProvider).value!;
  return user.categories;
}
