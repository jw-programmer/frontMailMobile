import 'package:flutter/material.dart';
import 'package:mailsendermodile/models/Email.dart';
import 'package:email_validator/email_validator.dart';
import 'package:mailsendermodile/services/EmailService.dart';

class EmailForm extends StatefulWidget {
  @override
  _EmailFormState createState() => _EmailFormState();
}

class _EmailFormState extends State<EmailForm> {
  final _formKey = GlobalKey<FormState>();

  Email _email = Email.clean();

  _sendEmail() {
    EmailService emailService = EmailService();
    emailService.sendMail(_email);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          TextFormField(
            decoration:
                InputDecoration(hintText: "Digite o e-mail do remetente"),
            keyboardType: TextInputType.emailAddress,
            onSaved: (String val) {
              _email.recipient = val;
            },
            validator: (String val) {
              if (!EmailValidator.validate(val) || val.isEmpty) {
                return "Não é um e-mail válido e não pode ser vazio";
              }
              return null;
            },
          ),
          TextFormField(
            decoration: InputDecoration(
                hintText: "Digite o seu nome para indentificação"),
            onSaved: (String val) {
              _email.sender = val;
            },
            validator: (String val) {
              if (val.isEmpty) {
                return "Não pode ser vazio";
              }
              return null;
            },
          ),
          TextFormField(
            decoration: InputDecoration(hintText: "Digite o assunto"),
            onSaved: (String val) {
              _email.subject = val;
            },
            validator: (String val) {
              if (val.isEmpty) {
                return "Não pode ser vazio";
              }
              return null;
            },
          ),
          TextFormField(
            decoration: InputDecoration(
                hintText: "Sua mensagem.", hintMaxLines: 5, helperMaxLines: 5),
            keyboardType: TextInputType.multiline,
            maxLines: 5,
            onSaved: (String val) {
              _email.message = val;
            },
            validator: (String val) {
              if (val.isEmpty) {
                return "Não pode ser vazio";
              }
              return null;
            },
          ),
          RaisedButton(
            onPressed: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                _sendEmail();
              }
            },
            child: Text("Enviar Email"),
          ),
        ],
      ),
    ));
  }
}
