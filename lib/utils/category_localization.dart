import 'package:flutter/material.dart';
import 'package:news/api/model/category/category.dart';
import 'package:news/l10n/app_localizations.dart';

String getCategoryTitle(BuildContext context, Category category) {
  switch (category.id) {
    case 'general':
      return AppLocalizations.of(context)!.general;
    case 'business':
      return AppLocalizations.of(context)!.business;
    case 'entertainment':
      return AppLocalizations.of(context)!.entertainment;
    case 'health':
      return AppLocalizations.of(context)!.health;
    case 'science':
      return AppLocalizations.of(context)!.science;
    case 'technology':
      return AppLocalizations.of(context)!.technology;
    case 'sports':
      return AppLocalizations.of(context)!.sports;
    default:
      return category.title;
  }
}
