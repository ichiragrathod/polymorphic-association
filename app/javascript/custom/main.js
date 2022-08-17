$(document).ready(function()
{

  $("#signupbtn").click(function(){
    validate=true;
    let first_name = $("#first_name").val();
    let last_name = $("#last_name").val();
    let email = $("#email").val();
    let password = $("#password").val();
    let passwordconf = $("#passwordconf").val();
    let street_address = $("#street_address").val();
    let city = $("#city").val();
    let country = $("#country").val();
    let postal_code = $("#postal_code").val();
    let phone_number = $("#phone_number").val();
    let mobile_number = $("#mobile_number").val();

    if (first_name.length == "") 
    {
      $("#first_name_error").show();
      validate = false;
    }else {
      $("#first_name_error").hide();
      validate = true;
    }

    if (last_name.length == "") 
    {
      $("#last_name_error").show();
      validate = false;
    }else {
      $("#last_name_error").hide();
      validate = true;
    }

    if (email.length == "") 
    {
      $("#email_error").show();
      validate = false;
    }else {
      $("#email_error").hide();
      validate = true;
    }

    if (password.length == "") 
    {
      $("#password_error").show();
      validate = false;
    }else {
      $("#password_error").hide();
      validate = true;
    }

    if (passwordconf.length == "") 
    {
      $("#password_confirm_error").show();
      validate = false;
    }else {
      $("#password_confirm_error").hide();
      validate = true;
    }

    if (street_address.length == "") 
    {
      $("#street_address_error").show();
      validate = false;
    }else {
      $("#street_address_error").hide();
      validate = true;
    }
    if (city.length == "") 
    {
      $("#city_error").show();
      validate = false;
    }else {
      $("#city_error").hide();
      validate = true;
    }
    if (country.length == "") 
    {
      $("#country_error").show();
      validate = false;
    }else {
      $("#country_error").hide();
      validate = true;
    }

    if (postal_code.length == "") 
    {
      $("#postal_code_error").show();
      validate = false;
    }else {
      $("#postal_code_error").hide();
      validate = true;
    }
    if (phone_number.length == "") 
    {
      $("#phone_number_error").show();
      validate = false;
    }else {
      $("#phone_number_error").hide();
      validate = true;
    }
    if (mobile_number.length == "") 
    {
      $("#mobile_number_error").show();
      validate = false;
    }else {
      $("#mobile_number_error").hide();
      validate = true;
    }
    return validate;
  });

  
  $("#submitbtn").click(function(){
    if (validateEmail() && validatePass())
      return true;
    else 
      return false;
  });

  function validateEmail() {
    let emailValue = $("#emailfield").val();
    if (emailValue.length == "") {
      $("#emailerror").show();
      return false;
    }else {
      $("#emailerror").hide();
      return true;
    }
  }

  function validatePass() {
    let passValue = $("#passfield").val();
    if (passValue.length == "") {
      $("#passerror").show();
      return false;
    }else {
      $("#passerror").hide();
      return true;
    }
  }

  
});