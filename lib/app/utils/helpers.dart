import 'package:thyyweets/app/utils/custom_alert.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Helper{

  inputValidation(value){

    if (value.isEmpty) {
        return 'O campo está vazio';
      }
      return null;
    }
  
  cpfValidation(String value){

    var cpf = value.replaceAll(".", "");
    cpf = cpf.replaceAll("-", "");
    
    if (value.isEmpty) {
        return 'O campo está vazio';
    }if( cpf.runes.length != 11){
        return 'CPF inválido';
    }
      return null;
    }
  
  inputValidationEmail(value){

    if (value.isEmpty) {
        return 'O campo está vazio';
    }else if(!value.contains("@")){
        return 'E-mail inválido';
    }
      return null;
    }
  
  launchPhone(BuildContext context,value)async{
    
    if(await canLaunch("tel:"+value)){
      await launch("tel:"+value);
    }else{
      CustomAlert().errorMessage(context, "Erro", "Não foi possivel obter o telefone");
    }
  }

  launchWebsite(BuildContext context,value)async{
    
    if(await canLaunch(value)){
      await launch(value);
    }else{
      CustomAlert().errorMessage(context, "Erro", "Não foi possivel obter o telefone");
    }
  }

  launchEmail(BuildContext context,value)async{
    
    if(await canLaunch("mailto:"+value)){
      await launch("mailto:"+value);
    }else{
      CustomAlert().errorMessage(context, "Erro", "Não foi possivel obter o telefone");
    }
  }

  launchWhatsapp(BuildContext context,value)async{
    
    var whats = "https://api.whatsapp.com/send?phone=55${value}&text=Ol%C3%A1%2C%20gostaria%20de%20informa%C3%A7%C3%B5es%20sobre%20meu%20agendamento.";

    if(await canLaunch(whats)){

      await launch(whats);

    }else{
      CustomAlert().errorMessage(context, "Erro", "Não foi possivel obter o whatsapp");
    }
  }

}