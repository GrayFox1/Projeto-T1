import 'package:flutter/material.dart';
import 'package:so_tops/models/user_model.dart';
import 'package:so_tops/screens/signup_screen.dart';
import 'package:scoped_model/scoped_model.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final emailController = TextEditingController();
  final passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          title: Text("Entrar"),
          centerTitle: true,
        ),
        body: ScopedModelDescendant<UserModel>(
          builder: (context, child, model) {
            if (model.isLoading) {
              return Center(child: CircularProgressIndicator());
            }
            return Form(
              key: formKey,
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 50.0),
                children: <Widget>[
                  SizedBox(height: 200.0),
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      hintText: "E-mail",
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (text) {
                      if (text.isEmpty || !text.contains("@"))
                        return "E-mail inválido!";
                    },
                  ),
                  SizedBox(height: 10.0),
                  TextFormField(
                    controller: passController,
                    decoration: InputDecoration(hintText: "Senha"),
                    obscureText: true,
                    validator: (text) {
                      if (text.isEmpty || text.length < 4)
                        return "Senha inválida!";
                    },
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: FlatButton(
                      onPressed: () {
                        if(emailController.text.isEmpty){
                          onFail(errorMsg: "Insira um e-mail válido para recuperar a senha", error: true);
                        }
                        else{
                          model.recoverPass(emailController.text);
                          onFail(errorMsg: "Confira seu e-mail!", error: false);
                        }
                      },
                      padding: EdgeInsets.zero,
                      child: Text(
                        "Esqueci minha senha",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            fontSize: 12.0,
                            color: Theme.of(context).buttonColor)
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  SizedBox(
                    height: 44.0,
                    child: RaisedButton(
                      child: Text("Entrar", style: TextStyle(fontSize: 18.0)),
                      textColor: Colors.white,
                      color: Theme.of(context).primaryColor,
                      onPressed: () {
                        if (formKey.currentState.validate()) {
                          model.signIn(
                              email: emailController.text,
                              pass: passController.text,
                              onSuccess: onSuccess,
                              onFail: onFail);
                        }
                      },
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Não possui conta?",
                      style: TextStyle(fontSize: 12.0)),
                      FlatButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => SignUpScreen())
                        );
                      },
                      child: Text(
                        "Criar Conta", 
                        style: TextStyle(
                            fontSize: 12.0,
                            color: Theme.of(context).buttonColor)
                      ),
                    ),
                    ],
                  ),
                ],
              ),
            );
          },
        ));
  }

  void onSuccess() {
    Navigator.of(context).pop();
  }

  void onFail({@required String errorMsg, @required bool error}) {
    scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(errorMsg, textAlign: TextAlign.center,),
      backgroundColor: (error) ? Colors.redAccent : Theme.of(context).primaryColor,
      duration: Duration(seconds: 2),
    ));
  }
}
