import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../cores/constants/colors.dart';
import '../../../cores/widgets/xafe_appbar.dart';
import '../../../cores/widgets/xafe_button.dart';
import '../../../cores/widgets/xafe_header.dart';
import '../../../cores/widgets/xafe_input.dart';

/// [AddCategoryScreen] screen to add a new category
class AddExpenseScreen extends StatelessWidget {
  final GlobalKey<FormState> _addExpense = GlobalKey<FormState>();

  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

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
              XafeHeader(title: 'Add an expense'),
              SizedBox(height: 20.0),
              Expanded(
                child: SingleChildScrollView(
                  child: Form(
                    key: _addExpense,
                    child: Column(
                      children: [
                        XafeInputField(
                          hintText: 'expense amount',
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
                          hintText: 'Select category',
                          controller: _categoryController,
                          isFilled: true,
                          suffixIcon: GestureDetector(
                            child: Icon(
                              Icons.arrow_drop_down,
                              color: subtitleColor,
                            ),
                            onTap: () {},
                          ),
                          validator: (cat) {
                            if (cat.isEmpty) {
                              return 'Category is required';
                            }

                            return null;
                          },
                          inputType: TextInputType.text,
                        ),
                        SizedBox(height: 10.0),
                        XafeInputField(
                          hintText: 'expense name',
                          isFilled: true,
                          controller: _nameController,
                          validator: (amount) {
                            if (amount.isEmpty) return 'Name is required';
                            return null;
                          },
                          inputType: TextInputType.text,
                        ),
                        SizedBox(height: 10.0),
                        XafeInputField(
                          hintText: 'date (dd/mm/yyyy)',
                          isFilled: true,
                          controller: _dateController,
                          validator: (date) {
                            if (date.isEmpty) return 'Date is required';
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
                  text: 'Add Expense',
                  onPressed: () {
                    if (!_addExpense.currentState.validate()) return;
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
