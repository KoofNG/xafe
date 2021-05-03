import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../cores/constants/colors.dart';
import '../../../cores/widgets/xafe_appbar.dart';
import '../../../cores/widgets/xafe_button.dart';
import '../../../cores/widgets/xafe_header.dart';
import '../../../cores/widgets/xafe_input.dart';

/// [AddBudgetScreen] screen to add a new budget
class AddBudgetScreen extends StatelessWidget {
  final GlobalKey<FormState> _addBudget = GlobalKey<FormState>();

  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

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
              XafeHeader(title: 'Create a budget'),
              SizedBox(height: 20.0),
              Expanded(
                child: SingleChildScrollView(
                  child: Form(
                    key: _addBudget,
                    child: Column(
                      children: [
                        XafeInputField(
                          hintText: 'Budget name',
                          isFilled: true,
                          controller: _nameController,
                          validator: (name) {
                            if (name.isEmpty) return 'Budget name is required';
                            return null;
                          },
                          inputType: TextInputType.text,
                        ),
                        SizedBox(height: 10.0),
                        XafeInputField(
                          hintText: 'Budget amount',
                          isFilled: true,
                          controller: _amountController,
                          validator: (amount) {
                            if (amount.isEmpty) return 'Amount is required';
                            if (double.parse(amount) < 0.5) {
                              return 'Amount is too low';
                            }
                            return null;
                          },
                          inputType: TextInputType.number,
                        ),
                        SizedBox(height: 10.0),
                        XafeInputField(
                          hintText: 'Choose Interval',
                          controller: _categoryController,
                          isFilled: true,
                          suffixIcon: GestureDetector(
                            child: Icon(
                              Icons.arrow_drop_down,
                              color: subtitleColor,
                            ),
                            onTap: () {},
                          ),
                          validator: (interval) {
                            if (interval.isEmpty) {
                              return 'Interval is required';
                            }
                            return null;
                          },
                          inputType: TextInputType.text,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20.0),
                child: XafeButton(
                  text: 'Create Budget',
                  onPressed: () {
                    if (!_addBudget.currentState.validate()) return;
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
