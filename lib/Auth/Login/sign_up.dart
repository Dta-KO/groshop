import 'package:flutter/material.dart';
import 'package:groshop/Components/custom_button.dart';
import 'package:groshop/Components/entry_field.dart';
import 'package:groshop/Locale/locales.dart';
import 'package:groshop/Routes/routes.dart';
import 'package:groshop/Theme/colors.dart';
import 'package:grouped_buttons/grouped_buttons.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String? sex;

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context);
    List<String> sexLabels = [locale.male, locale.female];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          locale.register,
          style: TextStyle(color: kMainTextColor),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Spacer(
            flex: 1,
          ),
          EntryField(
            label: locale.fullName,
            hint: locale.enterFullName,
            keyboardType: TextInputType.name,
            suffixIcon: Icons.person_outline_rounded,
          ),
          EntryField(
            label: locale.emailAddress,
            hint: locale.enterEmailAddress,
            keyboardType: TextInputType.emailAddress,
            suffixIcon: Icons.alternate_email_outlined,
          ),
          EntryField(
            label: locale.address,
            hint: locale.addAddress,
            suffixIcon: Icons.place_outlined,
          ),
          EntryField(
            label: locale.birthday,
            hint: locale.enterBirthday,
            keyboardType: TextInputType.datetime,
          ),
          RadioButtonGroup(
            activeColor: Theme.of(context).primaryColor,
            labelStyle: Theme.of(context).textTheme.caption,
            onSelected: (selectSex) {
              setState(() {
                sex = selectSex;
              });
            },
            labels: sexLabels,
            itemBuilder: (Radio radioButton, Text title, int i) {
              return Column(
                children: <Widget>[
                  Container(
                    height: 56.7,
                    color: Theme.of(context).scaffoldBackgroundColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0),
                      child: ListTile(
                        leading: radioButton,
                        title: Text(
                          sexLabels[i],
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1
                              ?.copyWith(fontSize: 19),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
          Spacer(
            flex: 5,
          ),
          CustomButton(
            onTap: () {
              Navigator.pushNamed(context, PageRoutes.verification);
            },
            margin: 28,
            radius: 5,
            padding: 15,
          ),
          Spacer(
            flex: 1,
          )
        ],
      ),
    );
  }
}
