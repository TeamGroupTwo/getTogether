<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <style>
    .label-colorcode button{
      border-radius:20px;
      width : 25px;
      height: 15px;
    }
    #label-color1{
      background : #F7FE2E;
    }
    #label-color2{
      background : #00FFFF;
    }
    #label-color3{
      background : #FA58AC;
    }
    #label-color4{
      background : #7401DF;
    }
    #label-color5{
      background : #01DF01;
    }
    #label-color6{
      background : #FF8000;
    }
    #label-color7{
      background : #0080FF;
    }
    #label-color8{
      background : #088A4B;
    }
    #label-color9{
      background : #FF0000;
    }
    #label-color10{
      background : #A9BCF5;
    }
    </style>
  </head>
  <body>
  <div class="label-colorcode">
    <button type='button' id="label-color1" value="#F7FE2E"></button>
    <button type='button' id="label-color2" value="#00FFFF"></button>
    <button type='button' id="label-color3" value="#FA58AC"></button>
    <button type='button' id="label-color4" value="#7401DF"></button>
    <button type='button' id="label-color5" value="#01DF01"></button><br>
    <button type='button' id="label-color6" value="#FF8000"></button>
    <button type='button' id="label-color7" value="#0080FF"></button>
    <button type='button' id="label-color8" value="#088A4B"></button>
    <button type='button' id="label-color9" value="#FF0000"></button>
    <button type='button' id="label-color10" value="#A9BCF5"></button>
    <input id = "colorcode"type="text" style="display : none"/>
    </div>
    <script>
    $('.label-colorcode').children().on('click',function(){
    	$('#colorcode').attr('value',$(this).val());
    	var code = $('#colorcode').val();
    });
    </script>
  </body>
</html>