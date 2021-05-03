import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../cores/constants/colors.dart';
import '../../../cores/widgets/xafe_appbar.dart';
import '../../../cores/widgets/xafe_button.dart';
import '../../../cores/widgets/xafe_header.dart';
import '../../../cores/widgets/xafe_input.dart';

/// [AddCategoryScreen] screen to add a new category
class AddCategoryScreen extends StatelessWidget {
  final GlobalKey<FormState> _addCategory = GlobalKey<FormState>();

  final TextEditingController _cateoryNameController = TextEditingController();

  final TextEditingController _categoryemoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              XafeAppBar(),
              SizedBox(height: 30.0),
              XafeHeader(title: 'Add a spending category'),
              SizedBox(height: 20.0),
              Expanded(
                child: SingleChildScrollView(
                  child: Form(
                    key: _addCategory,
                    child: Column(
                      children: [
                        XafeInputField(
                          hintText: 'Enter category name',
                          isFilled: true,
                          controller: _cateoryNameController,
                          validator: (name) {
                            if (name.isEmpty) return 'Email is required';

                            return null;
                          },
                          inputType: TextInputType.emailAddress,
                        ),
                        SizedBox(height: 10.0),
                        XafeInputField(
                          hintText: 'Choose category emoji',
                          controller: _categoryemoController,
                          isFilled: true,
                          suffixIcon: GestureDetector(
                            child: Icon(
                              Icons.arrow_drop_down,
                              color: subtitleColor,
                            ),
                            onTap: () {},
                          ),
                          validator: (emoji) {
                            if (emoji.isEmpty) {
                              return 'Emoji is required';
                            }

                            return null;
                          },
                          inputType: TextInputType.text,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20.0),
                child: XafeButton(
                  text: 'Create Category',
                  onPressed: () {
                    if (!_addCategory.currentState.validate()) return;
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
