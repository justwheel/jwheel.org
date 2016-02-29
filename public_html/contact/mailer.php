<?php
if(isset($_POST['submit'])) {

$to = "me@justinwflory.com";
$subject = "Contact Form Response";

// data the visitor provided
$name_field = filter_var($_POST['name'], FILTER_SANITIZE_STRING);
$email_field = filter_var($_POST['email'], FILTER_VALIDATE_EMAIL);
$comment = filter_var($_POST['comment'], FILTER_SANITIZE_STRING);

//constructing the message
$body = " From: $name_field\n\n E-Mail: $email_field\n\n Message:\n\n $comment";

// Mail the form.
mail($to, $subject, $body);

// Redirect to confirmation page.
header('Location: confirmation/');

} else {

// Handle this

}
?>