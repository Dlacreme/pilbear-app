import 'package:flutter/material.dart';
import 'package:pilbear_app/pages/profile_edit/profile_edit_birthdate.partial.dart';
import 'package:pilbear_app/pages/profile_edit/profile_edit_favorites.partial.dart';
import 'package:pilbear_app/pages/profile_edit/profile_edit_gender.partial.dart';
import 'package:pilbear_app/pages/profile_edit/profile_edit_name.partial.dart';
import 'package:pilbear_app/pages/profile_edit/profile_edit_picture.partial.dart';
import 'package:pilbear_app/widgets/steps_browser.widget.dart';

class ProfileEditPage extends StatefulWidget {
  @override
  _ProfileEditPage createState() => _ProfileEditPage();
}

class _ProfileEditPage extends State<ProfileEditPage> {
  @override
  Widget build(BuildContext context) {
    return StepsBrowser(children: [
      ProfileEditNamePartial(),
      ProfileEditPicturePartial(),
      ProfileEditFavoritesPartial(),
      ProfileEditBirthdatePartial(),
      ProfileEditGenderPartial(),
    ]);
  }
}
