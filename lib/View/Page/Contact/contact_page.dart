// ignore_for_file: prefer_final_fields, unnecessary_new

import 'package:erdemli_bel_app/Controller/extensions.dart';
import 'package:erdemli_bel_app/Controller/phone_input_formatter.dart';
import 'package:erdemli_bel_app/View/Style/colors.dart';
import 'package:erdemli_bel_app/View/View/submit_sheet.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({Key key}) : super(key: key);

  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final GlobalKey _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = new TextEditingController();
  final TextEditingController _surnameController = new TextEditingController();
  final TextEditingController _phoneController = new TextEditingController();
  final TextEditingController _subjectController = new TextEditingController();
  final TextEditingController _descriptionController =
      new TextEditingController();

  FocusNode _nameFocus = FocusNode();
  FocusNode _surnameFocus = FocusNode();
  FocusNode _phoneFocus = FocusNode();
  FocusNode _subjectFocus = FocusNode();
  FocusNode _descriptionFocus = FocusNode();

  Color focusColor = AppColors.blue;
  Color unFocusColor = Colors.grey.shade300;

  @override
  void initState() {
    _nameFocus.addListener(() {
      setState(() {});
    });
    _surnameFocus.addListener(() {
      setState(() {});
    });
    _phoneFocus.addListener(() {
      setState(() {});
    });
    _subjectFocus.addListener(() {
      setState(() {});
    });
    _descriptionFocus.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _nameFocus.dispose();
    _surnameFocus.dispose();
    _phoneFocus.dispose();
    _subjectFocus.dispose();
    _descriptionFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: const Text('İletişim'),
          centerTitle: false,
        ),
        body: SizedBox.expand(
            child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 30,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: DecoratedBox(
                    decoration: BoxDecoration(
                        color: focusColor.withOpacity(1),
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const FaIcon(
                            FontAwesomeIcons.headset,
                            color: Colors.white,
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Text(
                                "Bizimle bu form aracılığıyla iletişime geçebilirsiniz. ",
                                style: GoogleFonts.montserrat(
                                    fontSize: 17, color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
              ),
              buildFormInputs(context)
            ],
          ),
        )),
      ),
    );
  }

  Column buildFormInputs(BuildContext context) {
    return Column(
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
              color: _nameFocus.hasFocus
                  ? focusColor.withOpacity(.1)
                  : unFocusColor.withOpacity(.1),
              border: Border.all(
                width: 2,
                color: _nameFocus.hasFocus ? focusColor : unFocusColor,
              ),
              borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 20,
                  child: Center(
                    child: FaIcon(
                      FontAwesomeIcons.solidUser,
                      color: _nameFocus.hasFocus ? focusColor : unFocusColor,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: TextFormField(
                      controller: _nameController,
                      focusNode: _nameFocus,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                          hintText: 'Adınız', border: InputBorder.none),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: DecoratedBox(
            decoration: BoxDecoration(
                color: _surnameFocus.hasFocus
                    ? focusColor.withOpacity(.1)
                    : unFocusColor.withOpacity(.1),
                border: Border.all(
                  width: 2,
                  color: _surnameFocus.hasFocus ? focusColor : unFocusColor,
                ),
                borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 20,
                    child: Center(
                      child: FaIcon(FontAwesomeIcons.solidUser,
                          color:
                              _surnameFocus.hasFocus ? focusColor : unFocusColor),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: TextFormField(
                        controller: _surnameController,
                        focusNode: _surnameFocus,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                            hintText: 'Soyadınız', border: InputBorder.none),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: DecoratedBox(
            decoration: BoxDecoration(
                color: _phoneFocus.hasFocus
                    ? focusColor.withOpacity(.1)
                    : unFocusColor.withOpacity(.1),
                border: Border.all(
                    width: 2,
                    color: _phoneFocus.hasFocus ? focusColor : unFocusColor),
                borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 20,
                    child: Center(
                      child: FaIcon(
                        FontAwesomeIcons.phone,
                        color: _phoneFocus.hasFocus ? focusColor : unFocusColor,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: TextFormField(
                        controller: _phoneController,
                        focusNode: _phoneFocus,
                        textInputAction: TextInputAction.next,
                        inputFormatters: [phoneMaskFormatter],
                        decoration: const InputDecoration(
                            hintText: 'Telefon Numaranız',
                            border: InputBorder.none),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: DecoratedBox(
            decoration: BoxDecoration(
                color: _subjectFocus.hasFocus
                    ? focusColor.withOpacity(.1)
                    : unFocusColor.withOpacity(.1),
                border: Border.all(
                  width: 2,
                  color: _subjectFocus.hasFocus ? focusColor : unFocusColor,
                ),
                borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 20,
                    child: Center(
                      child: FaIcon(
                        FontAwesomeIcons.pencil,
                        color: _subjectFocus.hasFocus ? focusColor : unFocusColor,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: TextFormField(
                        controller: _subjectController,
                        focusNode: _subjectFocus,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                            hintText: 'Konu', border: InputBorder.none),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: DecoratedBox(
            decoration: BoxDecoration(
                color: _descriptionFocus.hasFocus
                    ? focusColor.withOpacity(.1)
                    : unFocusColor.withOpacity(.1),
                border: Border.all(
                  width: 2,
                  color: _descriptionFocus.hasFocus ? focusColor : unFocusColor,
                ),
                borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: SizedBox(
                      width: 20,
                      child: Center(
                        child: FaIcon(
                          FontAwesomeIcons.pencil,
                          color: _descriptionFocus.hasFocus
                              ? focusColor
                              : unFocusColor,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: TextFormField(
                        controller: _descriptionController,
                        focusNode: _descriptionFocus,
                        textInputAction: TextInputAction.next,
                        maxLines: 7,
                        decoration: const InputDecoration(
                            hintText: 'Detay', border: InputBorder.none),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: SizedBox(
            width: context.width,
            height: 50,
            child: MaterialButton(
              onPressed: () {
                FocusScope.of(context).unfocus();
                // TODO: evet, hayır callback'li sheet
                showFlexibleBookmarkSheet(
                  context: context,
                  sheetTitle: "Are you cola?",
                  approveText: "Yes i am",
                  cancelText: "No i'm not does'nt",
                  approveCallback: () => Navigator.pop(context),
                  cancelCallback: () => Navigator.pop(context),
                );
                // Navigator.pop(context);
              },
              color: focusColor,
              splashColor: AppColors.primaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Text(
                'Gönder',
                style:
                    GoogleFonts.montserrat(fontSize: 17, color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
