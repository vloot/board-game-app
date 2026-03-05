import 'package:flutter/material.dart';

class ModalForm extends StatelessWidget {
  final List<Widget> children;
  final GlobalKey<FormState> _formKey;
  final String formName;
  final FormAction formAction;

  const ModalForm(
    this._formKey, {
    super.key,
    required this.children,
    required this.formName,
    required this.formAction,
  });

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final keyboard = mq.viewInsets.bottom;
    return AnimatedPadding(
      padding: EdgeInsets.only(bottom: mq.viewInsets.bottom),
      duration: const Duration(milliseconds: 150),
      curve: Curves.easeOut,
      child: SafeArea(
        top: false,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: (mq.size.height - keyboard) * 0.65,
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 22, left: 42, right: 42),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 24),
                      child: Text(
                        formName,
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    ...children,
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

enum FormAction { add, edit }
